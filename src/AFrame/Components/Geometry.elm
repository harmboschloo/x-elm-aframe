module AFrame.Components.Geometry
    exposing
        ( Geometry
        , Primitive
        , geometry
        , primitive
        )

{-| <https://aframe.io/docs/0.8.0/components/geometry.html>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties2)


type Geometry
    = Geometry


type Primitive a
    = Primitive (List (Property a))


geometry : Primitive a -> List (Property Geometry) -> Attribute msg
geometry (Primitive primitiveProperties) =
    properties2 primitiveProperties >> attribute "geometry"


primitive : String -> List (Property a) -> Primitive a
primitive name primitiveProperties =
    Primitive (property "primitive" name :: primitiveProperties)
