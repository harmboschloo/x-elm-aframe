module AFrame
    exposing
        ( Node
        , Attribute
        , Supported
        , scene
        , id
        , node
        , attribute
        )

import Html
import Html.Attributes


type alias Node msg =
    Html.Html msg


type Attribute supports msg
    = Attribute (Html.Attribute msg)


type Supported
    = Supported


scene :
    List
        (Attribute
            { id : Supported
            , any : Supported
            }
            msg
        )
    -> List (Node msg)
    -> Node msg
scene =
    node "a-scene"


id : String -> Attribute { a | id : Supported } msg
id =
    attribute "id"


node :
    String
    ->
        List
            (Attribute
                { a
                    | any : Supported
                    , id : Supported
                }
                msg
            )
    -> List (Node msg)
    -> Node msg
node name attributes children =
    Html.node name
        (List.map unwrapAttribute attributes)
        children


unwrapAttribute : Attribute a msg -> Html.Attribute msg
unwrapAttribute (Attribute attribute) =
    attribute


attribute :
    String
    -> String
    -> Attribute supports msg
attribute name value =
    Attribute (Html.Attributes.attribute name value)
