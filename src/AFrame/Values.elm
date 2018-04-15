module AFrame.Values
    exposing
        ( string
        , number
        , bool
        )


string : String -> String
string string =
    string


number : number -> String
number =
    toString


bool : Bool -> String
bool bool =
    case bool of
        True ->
            "true"

        False ->
            "false"
