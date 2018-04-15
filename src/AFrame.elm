module AFrame
    exposing
        ( Supported
        , Attribute
        , attribute
        , Node
        , ChildNode
        , NodeAttribute
        , node
        , Entity
        , EntityAttribute
        , ChildEntity
        , entity
        , Primitive
        , primitive
        , Scene
        , scene
        , Assets
        , assets
        , AssetItem
        , assetItem
        , Image
        , image
        , Audio
        , audio
        , Video
        , video
        , Component
        , component
        , Property
        , property
        , toAttribute
        , toAttributeOf
        , id
        , src
        )

import Html
import Html.Attributes


type Supported
    = Supported


type Attribute provides msg
    = Attribute (Html.Attribute msg)


attribute : String -> String -> Attribute provides msg
attribute name value =
    Attribute (Html.Attributes.attribute name value)


type Node provides msg
    = Node (Html.Html msg)


type alias NodeAttribute accepts msg =
    Attribute
        { accepts
            | any : Supported
            , id : Supported
        }
        msg


type alias ChildNode accepts msg =
    Node
        { accepts
            | any : Supported
        }
        msg


node :
    String
    -> List (NodeAttribute acceptsNode msg)
    -> List (ChildNode acceptsChild msg)
    -> Node provides msg
node name attributes children =
    Node <|
        Html.node name
            (List.map unwrapAttribute attributes)
            (List.map unwrapNode children)


unwrapAttribute : Attribute a msg -> Html.Attribute msg
unwrapAttribute (Attribute attribute) =
    attribute


unwrapNode : Node a msg -> Html.Html msg
unwrapNode (Node html) =
    html



--  NODES


type alias Entity provides msg =
    Node { provides | entity : Supported } msg


type alias EntityAttribute accepts msg =
    NodeAttribute
        { accepts
            | component : Supported
        }
        msg


type alias ChildEntity accepts msg =
    ChildNode
        { accepts
            | entity : Supported
        }
        msg


entity :
    List (EntityAttribute {} msg)
    -> List (ChildEntity {} msg)
    -> Entity provides msg
entity =
    node "a-entity"


type alias Primitive accepts msg =
    Entity accepts msg


primitive :
    String
    -> List (EntityAttribute accepts msg)
    -> List (ChildEntity {} msg)
    -> Primitive provides msg
primitive =
    node


type alias Scene msg =
    Html.Html msg


scene :
    List (EntityAttribute {} msg)
    -> List (ChildEntity { assets : Supported } msg)
    -> Html.Html msg
scene attributes children =
    node "a-scene" attributes children |> unwrapNode


type alias Assets provides msg =
    Node { provides | assets : Supported } msg


assets :
    List (NodeAttribute {} msg)
    ->
        List
            (ChildNode
                { assetItem : Supported
                , image : Supported
                , audio : Supported
                , video : Supported
                }
                msg
            )
    -> Assets provides msg
assets =
    node "a-assets"



-- ASSET NODES


type alias AssetItem provides msg =
    Node { provides | assetItem : Supported } msg


assetItem :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> AssetItem provides msg
assetItem attributes =
    node "a-asset-item" attributes []


type alias Image provides msg =
    Node { provides | image : Supported } msg


image :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> Image provides msg
image attributes =
    node "img" attributes []


type alias Audio provides msg =
    Node { provides | audio : Supported } msg


audio :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> Audio provides msg
audio attributes =
    node "audio" attributes []


type alias Video provides msg =
    Node { provides | video : Supported } msg


video :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> Video provides msg
video attributes =
    node "video" attributes []



-- COMPONENTS


type alias Component provides msg =
    Attribute { provides | component : Supported } msg


component :
    String
    -> List (Property accepts)
    -> Component provides msg
component name properties =
    properties
        |> List.map (\(Property name value) -> name ++ ":" ++ value)
        |> String.join ";"
        |> attribute name


type Property provides
    = Property String String


property : String -> String -> Property provides
property name value =
    Property name value


toAttribute : Property provides -> Attribute provides msg
toAttribute (Property name value) =
    attribute name value


toAttributeOf : String -> Property providesA -> Attribute providesB msg
toAttributeOf name (Property _ value) =
    attribute name value



--  ATRRIBUTES


id : String -> Attribute { provides | id : Supported } msg
id =
    attribute "id"


src : String -> Attribute { provides | src : Supported } msg
src =
    attribute "src"
