module AFrame.Components.Debug
    exposing
        ( debug
        )

{-| <https://aframe.io/docs/0.8.0/components/debug.html>
-}

import AFrame exposing (Attribute, attribute)


debug : Attribute msg
debug =
    attribute "debug" ""
