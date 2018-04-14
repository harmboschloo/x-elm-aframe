module AFrame.Components
    exposing
        ( material
        , Shader
        , standard
        , Side
        , side
        , front
        , back
        , double
        )

import AFrame exposing (Attribute, Property, Supported, component, property)


-- MATERIAL


material :
    Shader a
    -> List (MaterialProperty a)
    -> Attribute { a | material : Supported } msg
material (Shader shader) properties =
    component "material" (property "shader" shader :: properties)


type Shader supports
    = Shader String


standard :
    Shader
        { src : Supported
        }
standard =
    Shader "standard"


type alias MaterialProperty a =
    Property
        { a
            | side : Supported
        }


type Side
    = Side String


side : Side -> Property { a | side : Supported }
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


type Src
    = Src String


src : Src -> Property { a | src : Supported }
src (Src src) =
    property "src" src

-- imageId 
-- videoId
-- url