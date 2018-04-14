module Minecraft exposing (view)

import AFrame exposing (Scene, scene, assets, image, id, src)
import AFrame.Primitives exposing (cylinder, radius, height)


view : Scene msg
view =
    scene []
        [ assets []
            [ image
                [ id "groundTexture"
                , src "https://cdn.aframe.io/a-painter/images/floor.jpg"
                ]
            ]
        , cylinder
            [ id "ground"
            , src "#groundTexture"
            , radius 32
            , height 0.1
            ]
            []
        ]
