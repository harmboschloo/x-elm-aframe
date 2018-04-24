module AFrame.Core
    exposing
        ( Color
        , Vec3
        , bool
        , color
        , vec3
        , id
        , scene
        , entity
        )

import AFrame exposing (Html, Attribute, node, attribute)
import Color
import Html.Lazy exposing (lazy)


-- Property Types


bool : Bool -> String
bool value =
    case value of
        True ->
            "true"

        False ->
            "false"


type alias Color =
    Color.Color


color : Color -> String
color value =
    let
        { red, green, blue } =
            Color.toRgb value
    in
        String.fromList
            [ '#'
            , toHex (red // 16)
            , toHex (red % 16)
            , toHex (green // 16)
            , toHex (green % 16)
            , toHex (blue // 16)
            , toHex (blue % 16)
            ]


toHex : Int -> Char
toHex number =
    case number of
        0 ->
            '0'

        1 ->
            '1'

        2 ->
            '2'

        3 ->
            '3'

        4 ->
            '4'

        5 ->
            '5'

        6 ->
            '6'

        7 ->
            '7'

        8 ->
            '8'

        9 ->
            '9'

        10 ->
            'A'

        11 ->
            'B'

        12 ->
            'C'

        13 ->
            'D'

        14 ->
            'E'

        15 ->
            'F'

        _ ->
            Debug.crash
                ("Can not convert "
                    ++ Basics.toString number
                    ++ " to hexadecimal."
                )


type alias Vec3 =
    { x : Float
    , y : Float
    , z : Float
    }


vec3 : Vec3 -> String
vec3 { x, y, z } =
    (toString x) ++ " " ++ (toString y) ++ " " ++ (toString z)



-- Attributes


id : String -> Attribute msg
id =
    attribute "id"



-- Nodes


{-| <https://aframe.io/docs/0.8.0/core/scene.html>

AFrame changes the dom extensively, which confuses the virtual dom of Elm.
That's why the scene can only be static html.
This is enforced by using `Html.Lazy.lazy` with and empty model.

-}
scene : List (Attribute msg) -> List (Html msg) -> Html msg
scene attributes children =
    lazy (always <| node "a-scene" attributes children) ()


{-| <https://aframe.io/docs/0.8.0/core/entity.html>
-}
entity : List (Attribute msg) -> List (Html msg) -> Html msg
entity =
    node "a-entity"
