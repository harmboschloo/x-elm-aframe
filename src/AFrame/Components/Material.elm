module AFrame.Components.Material
    exposing
        ( Material
        , Shader
        , Side(Front, Back, Double)
        , material
        , shader
        , side
        )

{-| <https://aframe.io/docs/0.8.0/components/material.html>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties2)


type Material
    = Material


type Shader a
    = Shader (List (Property a))


material : Shader a -> List (Property Material) -> Attribute msg
material (Shader shaderProperties) =
    properties2 shaderProperties >> attribute "material"


shader : String -> List (Property a) -> Shader a
shader name shaderProperties =
    Shader (property "shader" name :: shaderProperties)


type Side
    = Front
    | Back
    | Double


side : Side -> Property a
side value =
    property "side" <|
        case value of
            Front ->
                "front"

            Back ->
                "back"

            Double ->
                "double"
