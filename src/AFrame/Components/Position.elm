module AFrame.Components.Position
    exposing
        ( position
        )

{-| see <https://aframe.io/docs/0.8.0/components/position.html>
-}

import AFrame.Core exposing (Supported, Attribute)
import AFrame.Core.Entity exposing (componentSingle)
import AFrame.Core.Value as Value


position :
    number
    -> number
    -> number
    -> Attribute { provides | component : Supported } msg
position x y z =
    Value.vec3ToString x y z |> componentSingle "position"
