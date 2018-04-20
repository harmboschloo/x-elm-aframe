module XAFrame.Primitives.Sky
    exposing
        ( sky
        , radius
        , src
        , thetaLength
        )

{-| <https://aframe.io/docs/0.8.0/primitives/a-sky.html>
-}

import XAFrame.Core exposing (Supported, Html, Attribute)
import XAFrame.Core.Entity exposing (EntityAttribute, EntityNode, primitive)
import XAFrame.Core.Property exposing (toAttribute, toAttributeWithName)
import XAFrame.Core.Value exposing (Value)
import XAFrame.Components.Geometry as Geometry
import XAFrame.Components.Material as Material


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
    -> Html { provides | entity : Supported } msg
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
