module AFrame.Components.Rotation
    exposing
        ( rotation
        )

{-| <https://aframe.io/docs/0.8.0/components/rotation.html>
-}

import AFrame exposing (Attribute, attribute)
import AFrame.Core exposing (Vec3, vec3)


rotation : Vec3 -> Attribute msg
rotation =
    vec3 >> attribute "rotation"
