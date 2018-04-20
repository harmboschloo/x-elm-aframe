module XAFrame.Core.Animation
    exposing
        ( animation
        , attribute
        , from
        , repeat
        , to
        , indefinite
        )

{-| see <https://aframe.io/docs/0.8.0/core/animations.html>
-}

import XAFrame.Core as Core exposing (Supported, Node, Attribute, node)
import XAFrame.Core.Value as Value exposing (Value, value)


-- Node


type Sub a
    = Sub


animation :
    List
        (Attribute
            { any : Supported
            , attribute : Supported
            , from : Supported
            , repeat : Supported
            , to : Supported
            }
            msg
        )
    -> Node { provides | animation : Supported } msg
animation attributes =
    node "a-animation" attributes []



-- Attributes


attribute : String -> Attribute { provides | attribute : Supported } msg
attribute =
    Core.attribute "attribute"


from :
    Value a
    -> Attribute { provides | from : Supported } msg
from =
    Value.toString >> Core.attribute "from"


repeat :
    Value
        { indefinite : Supported
        , number : Supported
        }
    -> Attribute { provides | repeat : Supported } msg
repeat =
    Value.toString >> Core.attribute "repeat"


to :
    Value a
    -> Attribute { provides | to : Supported } msg
to =
    Value.toString >> Core.attribute "to"



-- Values


indefinite : Value { provides | indefinite : Supported }
indefinite =
    value "indefinite"
