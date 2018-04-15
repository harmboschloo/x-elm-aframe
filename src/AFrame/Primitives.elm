module AFrame.Primitives exposing (cylinder, src, radius, height)

import AFrame
    exposing
        ( Node
        , Attribute
        , Entity
        , EntityAttribute
        , ChildEntity
        , Supported
        , primitive
        , toAttribute
        )
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material


cylinder :
    List
        (EntityAttribute
            { height : Supported
            , src : Supported
            , radius : Supported
            }
            msg
        )
    -> List (ChildEntity {} msg)
    -> Entity provides msg
cylinder =
    primitive "a-cylinder"


height : number -> Attribute { provides | height : Supported } msg
height =
    Geometry.height >> toAttribute


src : String -> Attribute { provides | src : Supported } msg
src =
    Material.src >> toAttribute


radius : number -> Attribute { provides | radius : Supported } msg
radius =
    Geometry.radius >> toAttribute
