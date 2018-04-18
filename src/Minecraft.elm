module Minecraft exposing (view)

import AFrame.Core exposing (Supported, Node, Attribute, toHtml)
import AFrame.Core.Animation as Animation
import AFrame.Core.Assets as Assets
import AFrame.Core.Entity as Entity
import AFrame.Core.Image as Image
import AFrame.Core.Image.Value exposing (Image, image)
import AFrame.Core.Mixin as Mixin
import AFrame.Core.Scene as Scene
import AFrame.Core.Value exposing (Value, number, vec3)
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material
import AFrame.Components.Position as Position
import AFrame.Primitives.Cylinder as Cylinder
import AFrame.Primitives.Sky as Sky
import Html exposing (Html)
import KevinNgo.Components.Snap as Snap
import Minecraft.Components.RandomColor as RandomColor


groundTexture : Image providesId providesUrl providesSelector
groundTexture =
    image
        { id = "groundTexture"
        , url = "https://cdn.aframe.io/a-painter/images/floor.jpg"
        }


skyTexture : Image providesId providesUrl providesSelector
skyTexture =
    image
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


view : Html msg
view =
    toHtml scene
