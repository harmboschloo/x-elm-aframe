module AFrame.Primitives.Cursor
    exposing
        ( cursor
        )

{-| <https://aframe.io/docs/0.8.0/primitives/a-cursor.html>
-}

import AFrame exposing (Html, Attribute, node)


cursor : List (Attribute msg) -> List (Html msg) -> Html msg
cursor =
    node "a-cursor"
