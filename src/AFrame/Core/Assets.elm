module AFrame.Core.Assets
    exposing
        ( assets
        )

import AFrame.Core exposing (Supported, Node, Attribute, node)


assets :
    List (Attribute { any : Supported } msg)
    ->
        List
            (Node
                { any : Supported
                , assetItem : Supported
                , audio : Supported
                , image : Supported
                , mixin : Supported
                , video : Supported
                }
                msg
            )
    -> Node { provides | assets : Supported } msg
assets =
    node "a-assets"
