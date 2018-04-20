module AFrame.Components.Cursor
    exposing
        ( Cursor
        , cursor
        )

{-| <https://aframe.io/docs/0.8.0/components/cursor.html>
-}

import AFrame exposing (Attribute, Property, attribute, property, properties)


type Cursor
    = Cursor


cursor : List (Property Cursor) -> Attribute msg
cursor =
    properties >> attribute "cursor"
