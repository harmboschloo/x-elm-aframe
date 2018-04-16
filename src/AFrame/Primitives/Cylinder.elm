module AFrame.Primitives.Cylinder
    exposing
        ( cylinder
        , src
        , radius
        , height
        )

import AFrame.Core
    exposing
        ( Supported
        , Node
        , NodeAttribute
        , ChildNode
        , Attribute
        , node
        , toAttribute
        )
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material


cylinder :
    List
        (NodeAttribute
            { component : Supported
            , height : Supported
            , materialSrc : Supported
            , radius : Supported
            }
            msg
        )
    -> List (ChildNode { entity : Supported } msg)
    -> Node { provides | entity : Supported } msg
cylinder =
    node "a-cylinder"


height : number -> Attribute { provides | height : Supported } msg
height =
    Geometry.height >> toAttribute


src :
    AFrame.Core.Value
        { imageUrl : Supported
        , imageSelector : Supported
        , videoUrl : Supported
        , videoSelector : Supported
        }
    -> Attribute { provides | materialSrc : Supported } msg
src =
    Material.src >> toAttribute


radius : number -> Attribute { provides | radius : Supported } msg
radius =
    Geometry.radius >> toAttribute
