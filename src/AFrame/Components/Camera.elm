module AFrame.Components.Camera
    exposing
        ( Camera
        , camera
        , active
        )

{-| <https://aframe.io/docs/0.8.0/components/camera.html>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)
import AFrame.Core exposing (bool)


type Camera
    = Camera


camera : List (Property Camera) -> Attribute msg
camera =
    properties >> attribute "camera"


active : Bool -> Property Camera
active =
    bool >> property "active"
