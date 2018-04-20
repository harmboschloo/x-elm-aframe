module AFrame.Core
    exposing
        ( Vec3
        , bool
        , vec3
        , scene
        , entity
        )

import AFrame exposing (Html, Attribute, node)


-- Property Types


bool : Bool -> String
bool value =
    case value of
        True ->
            "true"

        False ->
            "false"


type alias Vec3 =
    { x : Float
    , y : Float
    , z : Float
    }


vec3 : Vec3 -> String
vec3 { x, y, z } =
    (toString x) ++ " " ++ (toString y) ++ " " ++ (toString z)



-- Nodes


{-| <https://aframe.io/docs/0.8.0/core/scene.html>
-}
scene : List (Attribute msg) -> List (Html msg) -> Html msg
scene =
    node "a-scene"


{-| <https://aframe.io/docs/0.8.0/core/entity.html>
-}
entity : List (Attribute msg) -> List (Html msg) -> Html msg
entity =
    node "a-entity"
