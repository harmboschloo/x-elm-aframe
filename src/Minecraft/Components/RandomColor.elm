module Minecraft.Components.RandomColor
    exposing
        ( randomColor
        )

import AFrame.Core exposing (Supported, Attribute)
import AFrame.Core.Entity exposing (component)


randomColor : Attribute { provides | component : Supported } msg
randomColor =
    component "random-color" []
