module AFrame.Components.LookControls
    exposing
        ( LookControls
        , lookControls
        , enabled
        )

{-| <https://aframe.io/docs/0.8.0/components/camera.html>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)
import AFrame.Core exposing (bool)


type LookControls
    = LookControls


lookControls : List (Property LookControls) -> Attribute msg
lookControls =
    properties >> attribute "look-controls"


enabled : Bool -> Property LookControls
enabled =
    bool >> property "enabled"
