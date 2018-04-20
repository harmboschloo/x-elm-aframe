module Game.Main exposing (main)

{-| <https://hacks.mozilla.org/2018/03/immersive-aframe-low-poly/>
-}

import AFrame exposing (Node, Attribute)
import AFrame.Core exposing (Vec3, scene, entity)
import AFrame.Components.Camera exposing (camera)
import AFrame.Components.LookControls exposing (lookControls)
import AFrame.Components.Position exposing (position)
import AFrame.Components.Stats exposing (stats)


main : Node msg
main =
    scene [ stats ]
        [ entity
            [ camera []
            , lookControls []
            , position (Vec3 0 1.5 0)
            ]
            []
        ]
