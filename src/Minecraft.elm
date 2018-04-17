module Minecraft exposing (view)

import AFrame.Core exposing (Supported, Node, toHtml)
import AFrame.Core.Assets as Assets
import AFrame.Core.Entity as Entity
import AFrame.Core.Image as Image
import AFrame.Core.Image.Value exposing (Image, image)
import AFrame.Core.Scene as Scene
import AFrame.Components.Geometry as Geometry
import AFrame.Components.Material as Material
import AFrame.Components.Position as Position
import AFrame.Primitives.Cylinder as Cylinder
import AFrame.Primitives.Sky as Sky
import Html exposing (Html)
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


scene : Node { provides | scene : Supported } msg
scene =
    Scene.scene []
        [ Assets.assets []
            [ Image.imageOf groundTexture
            , Image.imageOf skyTexture
            ]
        , Entity.entity
            [ Geometry.geometry Geometry.box
                [ Geometry.depth 0.5
                , Geometry.height 0.5
                , Geometry.width 0.5
                ]
            , Material.material Material.standard []
            , Position.position 0 0.5 -2
            , RandomColor.randomColor
            ]
            []
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
