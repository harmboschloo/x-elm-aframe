module AFrame.Primitives.Cylinder exposing (cylinder, src, radius, height)

import AFrame exposing (Node, SupportedAttribute, Supported, node, attribute)


cylinder :
    List
        (SupportedAttribute
            { src : Supported
            , radius : Supported
            , height : Supported
            }
            msg
        )
    -> List (Node msg)
    -> Node msg
cylinder =
    node "a-cylinder"


src : String -> AFrame.Attribute { a | src : Supported } msg
src =
    attribute "src"


radius : String -> AFrame.Attribute { a | radius : Supported } msg
radius =
    attribute "radius"


height : String -> AFrame.Attribute { a | height : Supported } msg
height =
    attribute "height"
