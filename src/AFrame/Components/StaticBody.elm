module AFrame.Components.StaticBody
    exposing
        ( StaticBody
        , staticBody
        , onBodyLoaded
        , onCollide
        )

{-| <https://github.com/donmccurdy/aframe-physics-system#dynamic-body-and-static-body>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)
import AFrame.PhysicsSystem as PhysicsSystem


type StaticBody
    = StaticBody


staticBody : List (Property StaticBody) -> Attribute msg
staticBody =
    properties >> attribute "static-body"


onBodyLoaded : (PhysicsSystem.Body -> msg) -> Attribute msg
onBodyLoaded =
    PhysicsSystem.onBodyLoaded


onCollide : (PhysicsSystem.Collision -> msg) -> Attribute msg
onCollide =
    PhysicsSystem.onCollide
