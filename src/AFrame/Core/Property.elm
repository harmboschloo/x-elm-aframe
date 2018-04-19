module AFrame.Core.Property
    exposing
        ( Property
        , property
        , toString
        , toAttribute
        , toAttributeWithName
        )

{-| see <https://aframe.io/docs/0.8.0/core/component.html>
-}

import AFrame.Core exposing (Attribute, attribute)


type Property supports
    = Property String String


property : String -> String -> Property provides
property name value =
    Property name value


toString : Property supports -> String
toString (Property name value) =
    name ++ ":" ++ value


toAttribute : Property supports -> Attribute supports msg
toAttribute (Property name value) =
    attribute name value


toAttributeWithName : String -> Property supports -> Attribute supports msg
toAttributeWithName name (Property _ value) =
    attribute name value
