module Minecraft exposing (view)

import Html
import AFrame exposing (Node)
import AFrame.Scene exposing (scene)
import AFrame.Primitives.Cylinder as Cylinder exposing (cylinder)


view : Node msg
view =
    scene []
        [ cylinder
            [ AFrame.id "ground"
            , Cylinder.src "https://cdn.aframe.io/a-painter/images/floor.jpg"
            , Cylinder.radius "32"
            , Cylinder.height "0.1"
            ]
            []
        ]
