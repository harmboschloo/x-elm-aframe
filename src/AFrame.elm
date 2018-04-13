module AFrame
    exposing
        ( Node
        , Attribute
        , SupportedAttribute
        , Supported
        , node
        , attribute
        , id
        )

import Html
import Html.Attributes


type alias Node msg =
    Html.Html msg


type Attribute supports msg
    = Attribute (Html.Attribute msg)



type alias SupportedAttribute a msg =
    Attribute
        { a
            | id : Supported
        }
        msg


type Supported
    = Supported

node :
    String
    -> List (SupportedAttribute a msg)
    -> List (Node msg)
    -> Node msg
node name attributes children =
    Html.node name
        (List.map unwrapAttribute attributes)
        children


unwrapAttribute : Attribute a msg -> Html.Attribute msg
unwrapAttribute (Attribute attribute) =
    attribute


attribute : String -> String -> Attribute a msg
attribute name value =
    Attribute (Html.Attributes.attribute name value)


id : String -> Attribute { a | id : Supported } msg
id =
    attribute "id"
