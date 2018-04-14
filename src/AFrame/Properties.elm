module AFrame.Properties
    exposing
        ( string
        , number
        , bool
        )

import AFrame exposing (Property, property)


string : String -> String -> Property supports
string =
    property


number : String -> number -> Property supports
number name number =
    property name (toString number)


bool : String -> Bool -> Property supports
bool name bool =
    property name
        (case bool of
            True ->
                "true"

            False ->
                "false"
        )
