module AFrame.Components.Material.Standard
    exposing
        ( Standard
        , standard
        , color
        )

{-| <https://aframe.io/docs/0.8.0/components/material.html#standard>
-}

import AFrame exposing (Property, property)
import AFrame.Core as Core exposing (Color)
import AFrame.Components.Material exposing (Shader, shader)


type Standard
    = Standard


standard : List (Property Standard) -> Shader Standard
standard =
    shader "standard"


color : Color -> Property Standard
color =
    Core.color >> property "color"
