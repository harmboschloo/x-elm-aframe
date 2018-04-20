module AFrame.PhysicsSystem.Physics
    exposing
        ( Physics
        , physics
        , debug
        )

{-| <https://github.com/donmccurdy/aframe-physics-system#system-configuration>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)
import AFrame.Core exposing (bool)


type Physics
    = Physics


physics : List (Property Physics) -> Attribute msg
physics =
    properties >> attribute "physics"


debug : Bool -> Property Physics
debug =
    bool >> property "debug"
