module AFrame.Components.Geometry.Box
    exposing
        ( Box
        , box
        , depth
        , height
        , width
        )

{-| <https://aframe.io/docs/0.8.0/components/geometry.html#box>
-}

import AFrame exposing (Property, property)
import AFrame.Components.Geometry exposing (Primitive, primitive)


type Box
    = Box


box : List (Property Box) -> Primitive Box
box =
    primitive "box"


depth : Float -> Property Box
depth =
    toString >> property "depth"


height : Float -> Property Box
height =
    toString >> property "height"


width : Float -> Property Box
width =
    toString >> property "width"
