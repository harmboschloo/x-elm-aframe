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
        , toAttributeWithName
        , value
        , mapValue
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


toHtml : Node a msg -> Html.Html msg
toHtml (Node html) =
    html


toHtmlAttribute : Attribute a msg -> Html.Attribute msg
toHtmlAttribute (Attribute name value) =
    Html.Attributes.attribute name value


type Attribute provides msg
    = Attribute String String


attribute : String -> String -> Attribute provides msg
attribute name value =
    Attribute name value


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


toAttributeWithName : String -> Property provides -> Attribute provides msg
toAttributeWithName name (Property _ value) =
    attribute name value


type Value provides
    = Value String


value : String -> Value provides
value =
    Value


mapValue : (String -> String) -> Value a -> Value b
mapValue mapper (Value value) =
    Value (mapper value)
