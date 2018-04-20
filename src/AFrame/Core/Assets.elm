module XAFrame.Core.Assets
    exposing
        ( assets
        )

{-| <https://aframe.io/docs/0.8.0/core/asset-management-system.html>
-}

import XAFrame.Core exposing (Supported, Html, Attribute, node)


assets :
    List (Attribute { any : Supported } msg)
    ->
        List
            (Html
                { any : Supported
                , assetItem : Supported
                , audio : Supported
                , image : Supported
                , mixin : Supported
                , video : Supported
                }
                msg
            )
    -> Html { provides | assets : Supported } msg
assets =
    node "a-assets"
