module AFrame.Components.Stats
    exposing
        ( stats
        )

{-| <https://aframe.io/docs/0.8.0/components/stats.html>
-}

import AFrame exposing (Attribute, attribute)


stats : Attribute msg
stats =
    attribute "stats" ""
