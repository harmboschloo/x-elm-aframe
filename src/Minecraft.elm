module Minecraft exposing (view)

import Html exposing (Html)
import AFrame.Core exposing (Supported, Value, toHtml)
import AFrame.Core.Scene exposing (scene)
import AFrame.Core.Assets exposing (assets)
import AFrame.Core.Image as Image exposing (image)
import AFrame.Core.Values exposing (imageId, imageUrl)
import AFrame.Primitives.Cylinder as Cylinder exposing (cylinder)


groundTextureId : Value { provides | imageId : Supported }
groundTextureId =
    imageId "groundTexture"


groundTextureUrl : Value { provides | imageUrl : Supported }
groundTextureUrl =
    imageUrl "https://cdn.aframe.io/a-painter/images/floor.jpg"


view : Html msg
view =
    toHtml <|
        scene []
            [ assets []
                [ image
                    [ Image.id groundTextureId
                    , Image.src groundTextureUrl
                    ]
                ]
            , cylinder
                [ Cylinder.src groundTextureId -- FIXME
                , Cylinder.radius 32
                , Cylinder.height 0.1
                ]
                []
            ]
