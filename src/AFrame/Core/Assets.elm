module AFrame.Core.Assets
    exposing
        ( assets
        )

import AFrame.Core exposing (Supported, Node, NodeAttribute, ChildNode, node)


assets :
    List (NodeAttribute {} msg)
    ->
        List
            (ChildNode
                { assetItem : Supported
                , image : Supported
                , audio : Supported
                , video : Supported
                }
                msg
            )
    -> Node { provides | assets : Supported } msg
assets =
    node "a-assets"
