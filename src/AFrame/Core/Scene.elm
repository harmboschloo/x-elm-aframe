module AFrame.Core.Scene
    exposing
        ( scene
        )

{-| see <https://aframe.io/docs/0.8.0/core/scene.html>
-}

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
