module AFrame.Core
    exposing
        ( Supported
        , Node
        , NodeAttribute
        , ChildNode
        , Attribute
        , Property
        , Value
        , node
        , toHtml
        , attribute
        , valueAttribute
        , component
        , property
        , valueProperty
        , toAttribute
        , toAttributeOf
        , value
        )

import Html
import Html.Attributes


type Supported
    = Supported


type Node provides msg
    = Node (Html.Html msg)


type alias NodeAttribute accepts msg =
    Attribute
        { accepts
            | any : Supported
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
            (List.map toHtmlAttribute attributes)
            (List.map toHtml children)


toHtmlAttribute : Attribute a msg -> Html.Attribute msg
toHtmlAttribute (Attribute attribute) =
    attribute


toHtml : Node a msg -> Html.Html msg
toHtml (Node html) =
    html


type Attribute provides msg
    = Attribute (Html.Attribute msg)


attribute : String -> String -> Attribute providesB msg
attribute name value =
    Attribute (Html.Attributes.attribute name value)


valueAttribute : String -> Value providesA -> Attribute providesB msg
valueAttribute name (Value value) =
    attribute name value


component :
    String
    -> List (Property accepts)
    -> Attribute { provides | component : Supported } msg
component name properties =
    properties
        |> List.map (\(Property name value) -> name ++ ":" ++ value)
        |> String.join ";"
        |> attribute name


type Property provides
    = Property String String


property : String -> String -> Property providesB
property name value =
    Property name value


valueProperty : String -> Value providesA -> Property providesB
valueProperty name (Value value) =
    property name value


toAttribute : Property provides -> Attribute provides msg
toAttribute (Property name value) =
    attribute name value


toAttributeOf : String -> Property providesA -> Attribute providesB msg
toAttributeOf name (Property _ value) =
    attribute name value


type Value provides
    = Value String


value : String -> Value provides
value =
    Value
