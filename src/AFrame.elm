module AFrame
    exposing
        ( Html
        , Attribute
        , Property
        , node
        , attribute
        , property
        , properties
        )

{-| <https://aframe.io/docs/0.8.0/introduction/>
-}

import Html
import Html.Attributes


type alias Html msg =
    Html.Html msg


type alias Attribute msg =
    Html.Attribute msg


type Property a
    = Property String String


node : String -> List (Attribute msg) -> List (Html msg) -> Html msg
node =
    Html.node


attribute : String -> String -> Attribute msg
attribute =
    Html.Attributes.attribute


property : String -> String -> Property a
property =
    Property


properties : List (Property a) -> String
properties =
    List.map (\(Property name value) -> name ++ ":" ++ value)
        >> String.join ";"
