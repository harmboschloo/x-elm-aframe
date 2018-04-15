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

import AFrame
    exposing
        ( Supported
        , Attribute
        , Component
        , Property
        , component
        , property
        )
import AFrame.Values as Values


material :
    Shader accepts
    -> List (MaterialProperty accepts)
    -> Component provides msg
material (Shader shader) properties =
    component "material" (property "shader" shader :: properties)


type Shader supports
    = Shader String


type alias MaterialProperty accepts =
    Property
        { accepts
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


side : Side -> Property { provides | side : Supported }
side (Side side) =
    property "side" side


front : Side
front =
    Side "front"


back : Side
back =
    Side "back"


double : Side
double =
    Side "double"


src : String -> Property { provides | src : Supported }
src =
    Values.string >> property "src"
