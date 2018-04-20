module XAFrame.Components.Material
    exposing
        ( Shader
        , MaterialProperty
        , material
        , standard
        , side
        , front
        , back
        , double
        , src
        )

{-| see <https://aframe.io/docs/0.8.0/components/material.html>
-}

import XAFrame.Core exposing (Supported, Attribute)
import XAFrame.Core.Entity exposing (component)
import XAFrame.Core.Property exposing (Property, property)
import XAFrame.Core.Value as Value exposing (Value, value)


type Shader accepts
    = Shader String


type alias MaterialProperty accepts =
    Property
        { accepts
            | side : Supported
            , materialSrc : Supported
        }


material :
    Shader accepts
    -> List (MaterialProperty accepts)
    -> Attribute { provides | component : Supported } msg
material (Shader shader) properties =
    component "material" (property "shader" shader :: properties)



-- SHADERS


standard :
    Shader
        { src : Supported
        }
standard =
    Shader "standard"



-- PROPERTIES


side :
    Value
        { front : Supported
        , back : Supported
        , double : Supported
        }
    -> Property { provides | side : Supported }
side =
    Value.toString >> property "side"


front : Value { provides | front : Supported }
front =
    value "front"


back : Value { provides | back : Supported }
back =
    value "back"


double : Value { provides | double : Supported }
double =
    value "double"


src :
    Value
        { imageUrl : Supported
        , imageSelector : Supported
        , videoUrl : Supported
        , videoSelector : Supported
        }
    -> Property { provides | materialSrc : Supported }
src =
    Value.toString >> property "src"
