module AFrame.Components.Material
    exposing
        ( material
        , Shader
        , MaterialProperty
        , standard
        , Side
        , side
        , front
        , back
        , double
        , src
        )

import AFrame exposing (Attribute, Property, Supported, Component, component)
import AFrame.Properties as Properties


material :
    Shader a
    -> List (MaterialProperty a)
    -> Component b msg
material (Shader shader) properties =
    component "material" (Properties.string "shader" shader :: properties)


type Shader supports
    = Shader String


type alias MaterialProperty a =
    Property
        { a
            | side : Supported
        }



-- SHADERS


standard :
    Shader
        { src : Supported
        }
standard =
    Shader "standard"



-- PROPERTIES


type Side
    = Side String


side : Side -> Property { a | side : Supported }
side (Side side) =
    Properties.string "side" side


front : Side
front =
    Side "front"


back : Side
back =
    Side "back"


double : Side
double =
    Side "double"


src : String -> Property { a | src : Supported }
src =
    Properties.string "src"
