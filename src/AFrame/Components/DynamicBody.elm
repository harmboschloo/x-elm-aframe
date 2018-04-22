module AFrame.Components.DynamicBody
    exposing
        ( DynamicBody
        , dynamicBody
        , onBodyLoaded
        , onCollide
        )

{-| <https://github.com/donmccurdy/aframe-physics-system#dynamic-body-and-static-body>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)
import AFrame.PhysicsSystem as PhysicsSystem


type DynamicBody
    = DynamicBody


dynamicBody : List (Property DynamicBody) -> Attribute msg
dynamicBody =
    properties >> attribute "dynamic-body"


onBodyLoaded : (PhysicsSystem.Body -> msg) -> Attribute msg
onBodyLoaded =
    PhysicsSystem.onBodyLoaded


onCollide : (PhysicsSystem.Collision -> msg) -> Attribute msg
onCollide =
    PhysicsSystem.onCollide
