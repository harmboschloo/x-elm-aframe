module AFrame.Core.Entity
    exposing
        ( entity
        )

import AFrame.Core exposing (Supported, Node, NodeAttribute, ChildNode, node)


entity :
    List (NodeAttribute { component : Supported } msg)
    -> List (ChildNode { entity : Supported } msg)
    -> Node { provides | entity : Supported } msg
entity =
    node "a-entity"
