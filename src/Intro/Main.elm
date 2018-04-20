module Intro.Main exposing (main)

{-| <https://aframe.io/docs/0.8.0/introduction/>
-}

import Html exposing (node)
import Html.Attributes exposing (attribute)


main : Html.Html a
main =
    node "a-scene"
        []
        [ node "a-box"
            [ attribute "position" "-1 0.5 -3"
            , attribute "rotation" "0 45 0"
            , attribute "color" "#4CC3D9"
            ]
            []
        , node "a-sphere"
            [ attribute "position" "0 1.25 -5"
            , attribute "radius" "1.25"
            , attribute "color" "#EF2D5E"
            ]
            []
        , node "a-cylinder"
            [ attribute "position" "1 0.75 -3"
            , attribute "radius" "0.5"
            , attribute "height" "1.5"
            , attribute "color" "#FFC65D"
            ]
            []
        , node "a-plane"
            [ attribute "position" "0 0 -4"
            , attribute "rotation" "-90 0 0"
            , attribute "width" "4"
            , attribute "height" "4"
            , attribute "color" "#7BC8A4"
            ]
            []
        , node "a-sky"
            [ attribute "color" "#ECECEC"
            ]
            []
        ]
