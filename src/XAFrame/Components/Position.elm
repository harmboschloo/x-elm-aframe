module XAFrame.Components.Position
    exposing
        ( position
        )

{-| see <https://aframe.io/docs/0.8.0/components/position.html>
-}

import XAFrame.Core exposing (Supported, Attribute)
import XAFrame.Core.Entity exposing (componentSingle)
import XAFrame.Core.Value as Value


position :
    number
    -> number
    -> number
    -> Attribute { provides | component : Supported } msg
position x y z =
    Value.vec3ToString x y z |> componentSingle "position"
