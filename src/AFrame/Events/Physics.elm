module AFrame.Events.Physics
    exposing
        ( Body
        , Collision
        , Vec3
        , onBodyLoaded
        , onCollide
        , bodyDecoder
        , collisionDecoder
        , vec3Decoder
        )

{-| <https://github.com/donmccurdy/aframe-physics-system#events>
-}

import Json.Decode as Decode exposing (Decoder)
import AFrame exposing (Attribute, on)


onBodyLoaded : (Body -> msg) -> Attribute msg
onBodyLoaded msg =
    on "body-loaded"
        (Decode.map msg
            (Decode.at [ "detail", "body" ] bodyDecoder)
        )


onCollide : (Collision -> msg) -> Attribute msg
onCollide msg =
    on "collide"
        (Decode.map msg
            (Decode.field "detail" collisionDecoder)
        )



-- Data


type alias Body =
    { id : Int
    , mass : Float
    , position : Vec3
    }


bodyDecoder : Decoder Body
bodyDecoder =
    Decode.map3 Body
        (Decode.field "id" Decode.int)
        (Decode.field "mass" Decode.float)
        (Decode.field "position" vec3Decoder)


type alias Collision =
    { body : Body
    }


collisionDecoder : Decoder Collision
collisionDecoder =
    Decode.map Collision
        (Decode.field "body" bodyDecoder)


type alias Vec3 =
    { x : Float
    , y : Float
    , z : Float
    }


vec3Decoder : Decoder Vec3
vec3Decoder =
    Decode.map3 Vec3
        (Decode.field "x" Decode.float)
        (Decode.field "y" Decode.float)
        (Decode.field "z" Decode.float)
