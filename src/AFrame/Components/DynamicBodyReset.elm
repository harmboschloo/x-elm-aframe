module AFrame.Components.DynamicBodyReset
    exposing
        ( DynamicBodyReset
        , dynamicBodyReset
        , key
        , position
        , velocity
        , angularVelocity
        )

import AFrame exposing (Attribute, Property, attribute, property, properties)
import AFrame.Core exposing (Vec3, vec3)


type DynamicBodyReset
    = DynamicBodyReset


dynamicBodyReset : List (Property DynamicBodyReset) -> Attribute msg
dynamicBodyReset =
    properties >> attribute "dynamic-body-reset"


key : Int -> Property DynamicBodyReset
key =
    toString >> property "key"


position : Vec3 -> Property DynamicBodyReset
position =
    vec3 >> property "position"


velocity : Vec3 -> Property DynamicBodyReset
velocity =
    vec3 >> property "velocity"


angularVelocity : Vec3 -> Property DynamicBodyReset
angularVelocity =
    vec3 >> property "angularVelocity"
