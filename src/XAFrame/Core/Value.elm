module XAFrame.Core.Value
    exposing
        ( Value
        , value
        , map
        , toString
        , boolean
        , booleanToString
        , color
        , colorToString
        , int
        , number
        , string
        , vec3
        , vec3ToString
        )

{-| see <https://aframe.io/docs/0.8.0/core/component.html#property-types>
-}

import Color exposing (Color)
import XAFrame.Core exposing (Supported)


type Value supports
    = Value String


value : String -> Value provides
value =
    Value


map : (String -> String) -> Value a -> Value b
map mapper (Value value) =
    Value (mapper value)


toString : Value a -> String
toString (Value value) =
    value


boolean : Bool -> Value { provides | boolean : Supported }
boolean =
    booleanToString >> value


booleanToString : Bool -> String
booleanToString bool =
    case bool of
        True ->
            "true"

        False ->
            "false"


color : Color -> Value { provides | color : Supported }
color =
    colorToString >> value


colorToString : Color -> String
colorToString color =
    let
        { red, green, blue } =
            Color.toRgb color
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


int : Int -> Value { provides | int : Supported }
int =
    Basics.toString >> value


number : number -> Value { provides | number : Supported }
number =
    Basics.toString >> value


string : String -> Value { provides | string : Supported }
string =
    value


vec3 : number -> number -> number -> Value { provides | vec3 : Supported }
vec3 x y z =
    vec3ToString x y z |> value


vec3ToString : number -> number -> number -> String
vec3ToString x y z =
    [ x, y, z ]
        |> List.map Basics.toString
        |> String.join " "
