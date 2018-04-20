module Minecraft.Components.RandomColor
    exposing
        ( randomColor
        )

import XAFrame.Core exposing (Supported, Attribute)
import XAFrame.Core.Entity exposing (component)


randomColor : Attribute { provides | component : Supported } msg
randomColor =
    component "random-color" []
