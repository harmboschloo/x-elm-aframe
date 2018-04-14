module AFrame.Components
    exposing
        ( material
        , Side(Front, Back, Double)
        , side
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


type Side supports =
    Side String


-- side : Side -> Property { a | side : Supported }
-- side side =
--     property "side"
--         (case side of
--             Front ->
--                 "front"

--             Back ->
--                 "back"

--             Double ->
--                 "double"
--         )
