module AFrame.Core.Scene
    exposing
        ( scene
        )

import AFrame.Core exposing (Supported, Node, Attribute, node)


scene :
    List
        (Attribute
            { any : Supported
            , component : Supported
            , id : Supported
            , mixin : Supported
            }
            msg
        )
    ->
        List
            (Node
                { any : Supported
                , assets : Supported
                , entity : Supported
                }
                msg
            )
    -> Node { provides | scene : Supported } msg
scene =
    node "a-scene"
