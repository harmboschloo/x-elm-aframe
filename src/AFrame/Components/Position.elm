module AFrame.Components.Position
    exposing
        ( position
        )

import AFrame.Core exposing (Supported, Attribute)
import AFrame.Core.Entity exposing (singleComponent)
import AFrame.Core.Value as Value exposing (Value, value)


position :
    number
    -> number
    -> number
    -> Attribute { provides | component : Supported } msg
position x y z =
    Value.vec3 x y z |> singleComponent "position"
