module AFrame.PhysicsSystem.StaticBody
    exposing
        ( StaticBody
        , staticBody
        )

{-| <https://github.com/donmccurdy/aframe-physics-system#dynamic-body-and-static-body>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)


type StaticBody
    = StaticBody


staticBody : List (Property StaticBody) -> Attribute msg
staticBody =
    properties >> attribute "static-body"
