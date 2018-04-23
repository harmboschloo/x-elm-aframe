module Game.Main exposing (main)

{-| <https://hacks.mozilla.org/2018/03/immersive-aframe-low-poly/>
-}

import Html
import Color
import Process
import Task
import Time
import AFrame exposing (Html, Attribute, attribute, on)
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
import AFrame.Components.DynamicBody exposing (dynamicBody)
import AFrame.Components.DynamicBodyReset as DynamicBodyReset exposing (dynamicBodyReset)
import AFrame.Components.StaticBody exposing (staticBody)
import AFrame.Events.Physics exposing (Body, Collision, onBodyLoaded, onCollide)
import AFrame.Primitives.Box as Box exposing (box)
import AFrame.Primitives.Cursor exposing (cursor)
import AFrame.Primitives.Plane as Plane exposing (plane)
import AFrame.Systems.Physics as Physics exposing (physics)


-- Model


type alias Model =
    { status : Status
    , ballId : Int
    , ballResetKey : Int
    , score : Int
    }


type Status
    = Initializing
    | Active
    | Resetting


init : ( Model, Cmd Msg )
init =
    ( { status = Initializing
      , ballId = 0
      , ballResetKey = 0
      , score = 0
      }
    , Cmd.none
    )



--Update


type Msg
    = BallLoaded Body
    | PaddleCollided Collision
    | Resetted


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        BallLoaded body ->
            ( { model
                | ballId = body.id
                , ballResetKey = model.ballResetKey + 1
                , status = Active
              }
            , Cmd.none
            )

        PaddleCollided collision ->
            if model.status == Active && collision.body.id == model.ballId then
                ( { model
                    | score = model.score + 1
                    , status = Resetting
                  }
                , (2 * Time.second)
                    |> Process.sleep
                    |> Task.perform (always Resetted)
                )
            else
                ( model, Cmd.none )

        Resetted ->
            if model.status == Resetting then
                ( { model
                    | ballResetKey = model.ballResetKey + 1
                    , status = Active
                  }
                , Cmd.none
                )
            else
                ( model, Cmd.none )



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
                    , onCollide PaddleCollided
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
            , dynamicBodyReset
                [ DynamicBodyReset.key model.ballResetKey
                , DynamicBodyReset.position (Vec3 0 0.6 -4)
                , DynamicBodyReset.velocity (Vec3 0 5 0)
                , DynamicBodyReset.angularVelocity (Vec3 0 0 0)
                ]
            , onBodyLoaded BallLoaded
            , attribute "id" "ball"
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
