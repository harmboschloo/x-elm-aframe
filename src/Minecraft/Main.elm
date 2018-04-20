module Minecraft.Main exposing (main)

{-| <https://aframe.io/docs/0.8.0/guides/building-a-minecraft-demo.html>
-}

import Html exposing (Html)
import XAFrame.Core exposing (Supported, Node, Attribute, toHtml)
import XAFrame.Core.Animation as Animation
import XAFrame.Core.Assets as Assets
import XAFrame.Core.Entity as Entity
import XAFrame.Core.Image as Image
import XAFrame.Core.Mixin as Mixin
import XAFrame.Core.Scene as Scene
import XAFrame.Core.Value exposing (Value, number, vec3)
import XAFrame.Components.Geometry as Geometry
import XAFrame.Components.Material as Material
import XAFrame.Components.Position as Position
import XAFrame.Primitives.Cylinder as Cylinder
import XAFrame.Primitives.Sky as Sky
import XKFrame.Components.Snap as Snap
import Minecraft.Components.RandomColor as RandomColor


groundTexture : Image.Props providesId providesUrl providesSelector
groundTexture =
    Image.props
        { id = "groundTexture"
        , url = "https://cdn.aframe.io/a-painter/images/floor.jpg"
        }


skyTexture : Image.Props providesId providesUrl providesSelector
skyTexture =
    Image.props
        { id = "skyTexture"
        , url = "https://cdn.aframe.io/a-painter/images/sky.jpg"
        }


crossOrigin : Attribute { provides | crossOrigin : Supported } msg
crossOrigin =
    Image.crossOrigin Image.anonymous


voxel : Value { mixinId : Supported }
voxel =
    Mixin.id "voxel"


scene : Node { provides | scene : Supported } msg
scene =
    Scene.scene []
        [ Assets.assets []
            [ Image.imageOf groundTexture [ crossOrigin ]
            , Image.imageOf skyTexture [ crossOrigin ]
            , Mixin.mixin voxel
                [ Geometry.geometry Geometry.box
                    [ Geometry.depth 0.5
                    , Geometry.height 0.5
                    , Geometry.width 0.5
                    ]
                , Material.material Material.standard []
                , RandomColor.randomColor
                , Snap.snap
                    [ Snap.offset 0.25 0.25 0.25
                    , Snap.spacing 0.5 0.5 0.5
                    ]
                ]
            ]
        , Entity.entity [ Entity.mixin [ voxel ], Position.position -1 0 -2 ] []
        , Entity.entity [ Entity.mixin [ voxel ], Position.position 0 0 -2 ] []
        , Entity.entity [ Entity.mixin [ voxel ], Position.position 0 1 -2 ]
            [ Animation.animation
                [ Animation.attribute "rotation"
                , Animation.to (vec3 0 360 0)
                , Animation.repeat Animation.indefinite
                ]
            ]
        , Entity.entity [ Entity.mixin [ voxel ], Position.position 1 0 -2 ] []
        , Cylinder.cylinder
            [ Cylinder.height 0.1
            , Cylinder.radius 32
            , Cylinder.src groundTexture.selector
            ]
            []
        , Sky.sky
            [ Sky.radius 30
            , Sky.src skyTexture.selector
            , Sky.thetaLength 90
            ]
            []
        ]


main : Html msg
main =
    toHtml scene
