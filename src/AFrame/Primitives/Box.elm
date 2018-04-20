module AFrame.Primitives.Box
    exposing
        ( box
        , color
        , depth
        , height
        , width
        )

{-| <https://aframe.io/docs/0.8.0/primitives/a-box.html>
-}

import AFrame exposing (Html, Attribute, node, toAttribute)
import AFrame.Core exposing (Color)
import AFrame.Components.Geometry.Box as Primitive
import AFrame.Components.Material.Standard as Shader


box : List (Attribute msg) -> List (Html msg) -> Html msg
box =
    node "a-box"


color : Color -> Attribute msg
color =
    Shader.color >> toAttribute


depth : Float -> Attribute msg
depth =
    Primitive.depth >> toAttribute


height : Float -> Attribute msg
height =
    Primitive.height >> toAttribute


width : Float -> Attribute msg
width =
    Primitive.width >> toAttribute
