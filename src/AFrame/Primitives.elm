module AFrame.Primitives exposing (cylinder, src, radius, height)

import AFrame exposing (Node, Attribute, Supported, node, attribute)


cylinder :
    List
        (Attribute
            { any : Supported
            , id : Supported
            , height : Supported
            , src : Supported
            , radius : Supported
            }
            msg
        )
    -> List (Node msg)
    -> Node msg
cylinder =
    node "a-cylinder"


height : String -> Attribute { a | height : Supported } msg
height =
    attribute "height"


src : String -> Attribute { a | src : Supported } msg
src =
    attribute "src"


radius : String -> Attribute { a | radius : Supported } msg
radius =
    attribute "radius"
