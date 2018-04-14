module Minecraft exposing (view)

import AFrame exposing (Node, scene, id)
import AFrame.Primitives exposing (cylinder, src, radius, height)


view : Node msg
view =
    scene []
        [ cylinder
            [ id "ground"
            , src "https://cdn.aframe.io/a-painter/images/floor.jpg"
            , radius 32
            , height 0.1
            ]
            []
        ]
