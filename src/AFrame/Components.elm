module AFrame.Components exposing (src)

import AFrame exposing (Attribute, Supported, attribute)


-- FIXME is property not attribute


src : String -> Attribute { a | src : Supported } msg
src =
    attribute "src"
