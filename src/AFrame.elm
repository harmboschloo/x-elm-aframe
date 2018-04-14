module AFrame
    exposing
        ( Node
        , Attribute
        , Property
        , Value
        , Supported
        , NodeAttribute
        , node
        , attribute
        , component
        , property
        , toAttribute
        , toAttributeOf
        , scene
        , id
        )

import Html
import Html.Attributes


type alias Node msg =
    Html.Html msg


type Attribute supports msg
    = Attribute (Html.Attribute msg)


type Property supports
    = Property String String


type Value supports
    = Value String


type Supported
    = Supported


type alias NodeAttribute a msg =
    Attribute
        { a
            | any : Supported
            , id : Supported
        }
        msg


node : String -> List (NodeAttribute a msg) -> List (Node msg) -> Node msg
node name attributes children =
    Html.node name
        (List.map unwrapAttribute attributes)
        children


unwrapAttribute : Attribute a msg -> Html.Attribute msg
unwrapAttribute (Attribute attribute) =
    attribute


attribute : String -> String -> Attribute supports msg
attribute name value =
    Attribute (Html.Attributes.attribute name value)


component : String -> List (Property a) -> Attribute supports msg
component name properties =
    properties
        |> List.map (\(Property name value) -> name ++ ":" ++ value)
        |> String.join ";"
        |> attribute name


property : String -> String -> Property supports
property name value =
    Property name value


toAttribute : Property a -> Attribute a msg
toAttribute (Property name value) =
    attribute name value


toAttributeOf : String -> Property a -> Attribute b msg
toAttributeOf name (Property _ value) =
    attribute name value



-- CORE NODES


scene :
    List (NodeAttribute {} msg)
    -> List (Node msg)
    -> Node msg
scene =
    node "a-scene"



-- CORE ATRRIBUTES


id : String -> Attribute { a | id : Supported } msg
id =
    attribute "id"
