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


type Attribute supports msg
    = Attribute (Html.Attribute msg)


attribute : String -> String -> Attribute supports msg
attribute name value =
    Attribute (Html.Attributes.attribute name value)


type Node supports msg
    = Node (Html.Html msg)


type alias NodeAttribute a msg =
    Attribute
        { a
            | any : Supported
            , id : Supported
        }
        msg


type alias ChildNode a msg =
    Node
        { a
            | any : Supported
        }
        msg


node :
    String
    -> List (NodeAttribute a msg)
    -> List (ChildNode b msg)
    -> Node supports msg
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


type alias Entity a msg =
    Node { a | entity : Supported } msg


type alias EntityAttribute a msg =
    NodeAttribute
        { a
            | component : Supported
        }
        msg


type alias ChildEntity a msg =
    ChildNode
        { a
            | entity : Supported
        }
        msg


entity :
    List (EntityAttribute {} msg)
    -> List (ChildEntity {} msg)
    -> Entity a msg
entity =
    node "a-entity"


type alias Primitive a msg =
    Entity a msg


primitive :
    String
    -> List (EntityAttribute a msg)
    -> List (ChildEntity {} msg)
    -> Primitive c msg
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


type alias Assets a msg =
    Node { a | assets : Supported } msg


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
    -> Assets a msg
assets =
    node "a-assets"



-- ASSET NODES


type alias AssetItem a msg =
    Node { a | assetItem : Supported } msg


assetItem :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> AssetItem a msg
assetItem attributes =
    node "a-asset-item" attributes []


type alias Image a msg =
    Node { a | image : Supported } msg


image :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> Image a msg
image attributes =
    node "img" attributes []


type alias Audio a msg =
    Node { a | audio : Supported } msg


audio :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> Audio a msg
audio attributes =
    node "audio" attributes []


type alias Video a msg =
    Node { a | video : Supported } msg


video :
    List
        (NodeAttribute
            { src : Supported
            }
            msg
        )
    -> Video a msg
video attributes =
    node "video" attributes []



-- COMPONENTS


type alias Component a msg =
    Attribute { a | component : Supported } msg


component :
    String
    -> List (Property a)
    -> Component b msg
component name properties =
    properties
        |> List.map (\(Property name value) -> name ++ ":" ++ value)
        |> String.join ";"
        |> attribute name


type Property a
    = Property String String


property : String -> String -> Property a
property name value =
    Property name value


toAttribute : Property a -> Attribute b msg
toAttribute (Property name value) =
    attribute name value


toAttributeOf : String -> Property a -> Attribute b msg
toAttributeOf name (Property _ value) =
    attribute name value



--  ATRRIBUTES


id : String -> Attribute { a | id : Supported } msg
id =
    attribute "id"


src : String -> Attribute { a | src : Supported } msg
src =
    attribute "src"
