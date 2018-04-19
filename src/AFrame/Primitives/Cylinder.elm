module AFrame.Primitives.Cylinder
    exposing
        ( cylinder
        , radius
        , height
        , src
        )

{-| see <https://aframe.io/docs/0.8.0/primitives/a-cylinder.html>
-}

import AFrame.Core exposing (Supported, Node, Attribute)
import AFrame.Core.Entity exposing (EntityAttribute, EntityNode, primitive)
import AFrame.Core.Property exposing (toAttribute)
import AFrame.Core.Value exposing (Value)
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material


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
