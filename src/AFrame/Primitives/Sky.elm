module AFrame.Primitives.Sky
    exposing
        ( sky
        , radius
        , src
        , thetaLength
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
        , toAttributeWithName
        )
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material


sky :
    List
        (NodeAttribute
            { component : Supported
            , materialSrc : Supported
            , radius : Supported
            , thetaLength : Supported
            }
            msg
        )
    -> List (ChildNode { entity : Supported } msg)
    -> Node { provides | entity : Supported } msg
sky =
    node "a-sky"


radius : number -> Attribute { provides | radius : Supported } msg
radius =
    Geometry.radius >> toAttribute


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


thetaLength : number -> Attribute { provides | thetaLength : Supported } msg
thetaLength =
    Geometry.thetaLength >> toAttributeWithName "theta-length"
