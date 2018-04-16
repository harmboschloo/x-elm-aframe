module AFrame.Components.Material
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

import AFrame.Core
    exposing
        ( Supported
        , Attribute
        , Property
        , Value
        , component
        , property
        , valueProperty
        , value
        )


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
    valueProperty "side"


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
    valueProperty "src"
