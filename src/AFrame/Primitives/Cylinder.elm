module XAFrame.Primitives.Cylinder
    exposing
        ( cylinder
        , radius
        , height
        , src
        )

{-| <https://aframe.io/docs/0.8.0/primitives/a-cylinder.html>
-}

import XAFrame.Core exposing (Supported, Node, Attribute)
import XAFrame.Core.Entity exposing (EntityAttribute, EntityNode, primitive)
import XAFrame.Core.Property exposing (toAttribute)
import XAFrame.Core.Value exposing (Value)
import XAFrame.Components.Geometry as Geometry
import XAFrame.Components.Material as Material


cylinder :
    List
        (EntityAttribute
            { height : Supported
            , materialSrc : Supported
            , radius : Supported
            }
            msg
        )
    -> List (EntityNode msg)
    -> Node { provides | entity : Supported } msg
cylinder =
    primitive "a-cylinder"


height : number -> Attribute { provides | height : Supported } msg
height =
    Geometry.height >> toAttribute


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
