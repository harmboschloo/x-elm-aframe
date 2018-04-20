module AFrame.Components.Position
    exposing
        ( position
        )

{-| <https://aframe.io/docs/0.8.0/components/position.html>
-}

import AFrame exposing (Attribute, attribute)
import AFrame.Core exposing (Vec3, vec3)


position : Vec3 -> Attribute msg
position =
    vec3 >> attribute "position"
