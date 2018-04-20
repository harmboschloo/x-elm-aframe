module AFrame.Components.Geometry.Plane
    exposing
        ( Plane
        , plane
        , height
        , width
        )

{-| <https://aframe.io/docs/0.8.0/components/geometry.html#plane>
-}

import AFrame exposing (Property, property)
import AFrame.Components.Geometry exposing (Primitive, primitive)


type Plane
    = Plane


plane : List (Property Plane) -> Primitive Plane
plane =
    primitive "plane"


height : Float -> Property Plane
height =
    toString >> property "height"


width : Float -> Property Plane
width =
    toString >> property "width"
