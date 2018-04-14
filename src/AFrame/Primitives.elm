module AFrame.Primitives exposing (cylinder, src, radius, height)

import AFrame
    exposing
        ( Node
        , Attribute
        , NodeAttribute
        , Supported
        , node
        , toAttribute
        )
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material


cylinder :
    List
        (NodeAttribute
            { height : Supported
            , src : Supported
            , radius : Supported
            }
            msg
        )
    -> List (Node msg)
    -> Node msg
cylinder =
    node "a-cylinder"


height : number -> Attribute { a | height : Supported } msg
height =
    Geometry.height >> toAttribute


src : String -> Attribute { a | src : Supported } msg
src =
    Material.src >> toAttribute


radius : number -> Attribute { a | radius : Supported } msg
radius =
    Geometry.radius >> toAttribute
