module AFrame
    exposing
        ( Html
        , Attribute
        , Property
        , node
        , attribute
        , property
        , properties
        , properties2
        , toAttribute
        , toAttributeWithName
        , on
        )

{-| <https://aframe.io/docs/0.8.0/introduction/>
-}

import Html
import Html.Attributes
import Html.Events
import Json.Decode exposing (Decoder)


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
    List.map propertyValue >> String.join ";"


properties2 : List (Property a) -> List (Property b) -> String
properties2 a b =
    (List.map propertyValue a ++ List.map propertyValue b)
        |> String.join ";"


propertyValue : Property a -> String
propertyValue (Property name value) =
    name ++ ":" ++ value


toAttribute : Property a -> Attribute msg
toAttribute (Property name value) =
    attribute name value


toAttributeWithName : String -> Property a -> Attribute msg
toAttributeWithName name (Property _ value) =
    attribute name value


on : String -> Decoder msg -> Attribute msg
on =
    Html.Events.on
