module AFrame.Primitives.Sky
    exposing
        ( sky
        , radius
        , src
        , thetaLength
        )

import AFrame.Core exposing (Supported, Node, Attribute)
import AFrame.Core.Entity exposing (EntityAttribute, EntityNode, primitive)
import AFrame.Core.Property exposing (toAttribute, toAttributeWithName)
import AFrame.Core.Value exposing (Value)
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material


sky :
    List
        (EntityAttribute
            { materialSrc : Supported
            , radius : Supported
            , thetaLength : Supported
            }
            msg
        )
    -> List (EntityNode msg)
    -> Node { provides | entity : Supported } msg
sky =
    primitive "a-sky"


radius : number -> Attribute { provides | radius : Supported } msg
radius =
    Geometry.radius >> toAttribute


src :
    Value
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
