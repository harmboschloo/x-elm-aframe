module Minecraft exposing (view)

import AFrame.Core exposing (Supported, Node, Value, toHtml)
import AFrame.Core.Assets as Assets
import AFrame.Core.Image as Image
import AFrame.Core.Scene as Scene
import AFrame.Core.Values exposing (Image, image)
import AFrame.Primitives.Cylinder as Cylinder
import AFrame.Primitives.Sky as Sky
import Html exposing (Html)


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
