module AFrame.Core.Values
    exposing
        ( audioId
        , audioUrl
        , boolean
        , booleanToString
        , color
        , colorToString
        , id
        , imageId
        , imageUrl
        , int
        , number
        , videoId
        , videoUrl
        )

import Color exposing (Color)
import AFrame.Core exposing (Supported, Value, value)


audioId : String -> Value { provides | audioId : Supported }
audioId =
    value


audioUrl : String -> Value { provides | audioUrl : Supported }
audioUrl =
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


id : String -> Value { provides | id : Supported }
id =
    value


imageId : String -> Value { provides | imageId : Supported }
imageId =
    value


imageUrl : String -> Value { provides | imageUrl : Supported }
imageUrl =
    value


int : Int -> Value { provides | int : Supported }
int =
    toString >> value


number : number -> Value { provides | number : Supported }
number =
    toString >> value


string : String -> Value { provides | string : Supported }
string =
    value


videoId : String -> Value { provides | videoId : Supported }
videoId =
    value


videoUrl : String -> Value { provides | videoUrl : Supported }
videoUrl =
    value
