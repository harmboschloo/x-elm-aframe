module AFrame.Components.Geometry.Sphere
    exposing
        ( Sphere
        , sphere
        , radius
        )

{-| <https://aframe.io/docs/0.8.0/components/geometry.html#sphere>
-}

import AFrame exposing (Property, property)
import AFrame.Components.Geometry exposing (Primitive, primitive)


type Sphere
    = Sphere


sphere : List (Property Sphere) -> Primitive Sphere
sphere =
    primitive "sphere"


radius : Float -> Property Sphere
radius =
    toString >> property "radius"
