module AFrame.Components.DynamicBody
    exposing
        ( DynamicBody
        , dynamicBody
        )

{-| <https://github.com/donmccurdy/aframe-physics-system#dynamic-body-and-static-body>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)


type DynamicBody
    = DynamicBody


dynamicBody : List (Property DynamicBody) -> Attribute msg
dynamicBody =
    properties >> attribute "dynamic-body"
