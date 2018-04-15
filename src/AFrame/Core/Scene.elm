module AFrame.Core.Scene
    exposing
        ( scene
        )

import AFrame.Core exposing (Supported, Node, NodeAttribute, ChildNode, node)


scene :
    List (NodeAttribute { component : Supported } msg)
    ->
        List
            (ChildNode
                { assets : Supported
                , entity : Supported
                }
                msg
            )
    -> Node { provides | scene : Supported } msg
scene =
    node "a-scene"
