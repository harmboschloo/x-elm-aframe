module AFrame.Primitives.Plane
    exposing
        ( plane
        , color
        , height
        , width
        )

{-| <https://aframe.io/docs/0.8.0/primitives/a-plane.html>
-}

import AFrame exposing (Html, Attribute, node, toAttribute)
import AFrame.Core exposing (Color)
import AFrame.Components.Geometry.Plane as Primitive
import AFrame.Components.Material.Standard as Shader


plane : List (Attribute msg) -> List (Html msg) -> Html msg
plane =
    node "a-plane"


color : Color -> Attribute msg
color =
    Shader.color >> toAttribute


height : Float -> Attribute msg
height =
    Primitive.height >> toAttribute


width : Float -> Attribute msg
width =
    Primitive.width >> toAttribute
