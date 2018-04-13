module AFrame.Scene exposing (scene)

import AFrame exposing (Node, SupportedAttribute, node)


scene : List (SupportedAttribute {} msg) -> List (Node msg) -> Node msg
scene =
    node "a-scene"
 