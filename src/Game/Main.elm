module Game.Main exposing (main)

{-| <https://hacks.mozilla.org/2018/03/immersive-aframe-low-poly/>
-}

import Color
import AFrame exposing (Html, Attribute)
import AFrame.Core exposing (Vec3, scene, entity)
import AFrame.Components.Camera exposing (camera)
import AFrame.Components.Geometry exposing (geometry)
import AFrame.Components.Geometry.Sphere as Sphere exposing (sphere)
import AFrame.Components.LookControls exposing (lookControls)
import AFrame.Components.Material exposing (material)
import AFrame.Components.Material.Standard as Standard exposing (standard)
import AFrame.Components.Position exposing (position)
import AFrame.Components.Rotation exposing (rotation)
import AFrame.Components.Stats exposing (stats)
import AFrame.Primitives.Box as Box exposing (box)
import AFrame.Primitives.Cursor exposing (cursor)
import AFrame.Primitives.Plane as Plane exposing (plane)


main : Html msg
main =
    scene [ stats ]
        [ entity
            [ camera []
            , lookControls []
            , position (Vec3 0 1.5 0)
            ]
            [ cursor [] []
            , -- paddle
              entity [ position (Vec3 0 0 -3) ]
                [ box
                    [ Box.color Color.blue
                    , Box.depth 3
                    , Box.height 0.5
                    , Box.width 0.25
                    ]
                    []
                ]
            ]
        , -- ball
          entity
            [ position (Vec3 0 1 -4)
            , material (standard [ Standard.color Color.green ]) []
            , geometry (sphere [ Sphere.radius 0.5 ]) []
            ]
            []
        , plane
            [ Plane.color Color.red
            , Plane.height 100
            , Plane.width 100
            , rotation (Vec3 -90 0 0)
            ]
            []
        ]
