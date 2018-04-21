module Game.Main exposing (main)

{-| <https://hacks.mozilla.org/2018/03/immersive-aframe-low-poly/>
-}

import Html
import Color
import AFrame exposing (Html, Attribute, on)
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
import AFrame.PhysicsSystem.Physics as Physics exposing (physics)
import AFrame.PhysicsSystem.DynamicBody exposing (dynamicBody)
import AFrame.PhysicsSystem.StaticBody exposing (staticBody)
import AFrame.PhysicsSystem.Body exposing (Body, onBodyLoaded)
import AFrame.Primitives.Box as Box exposing (box)
import AFrame.Primitives.Cursor exposing (cursor)
import AFrame.Primitives.Plane as Plane exposing (plane)


-- Model


type alias Model =
    { ball : Maybe Body
    }


init : ( Model, Cmd Msg )
init =
    ( { ball = Nothing
      }
    , Cmd.none
    )



--Update


type Msg
    = OnBallLoaded Body


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnBallLoaded body ->
            ( { model | ball = Just body }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    scene [ stats, physics [ Physics.debug True ] ]
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
                    , staticBody []
                    ]
                    []
                ]
            ]
        , -- ball
          entity
            [ position (Vec3 0 1 -4)
            , material (standard [ Standard.color Color.green ]) []
            , geometry (sphere [ Sphere.radius 0.5 ]) []
            , dynamicBody []
            , onBodyLoaded OnBallLoaded
            ]
            []
        , plane
            [ Plane.color Color.red
            , Plane.height 100
            , Plane.width 100
            , rotation (Vec3 -90 0 0)
            , staticBody []
            ]
            []
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }
