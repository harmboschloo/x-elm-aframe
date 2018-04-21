module AFrame.PhysicsSystem.Body
    exposing
        ( Body
        , onBodyLoaded
        )

{-| <https://github.com/donmccurdy/aframe-physics-system#events>
-}

import Json.Decode as Decode exposing (Decoder)
import AFrame exposing (Attribute, on)


type alias Body =
    { id : Int
    , mass : Float
    , position : Vec3
    }


type alias Vec3 =
    { x : Float
    , y : Float
    , z : Float
    }


onBodyLoaded : (Body -> msg) -> Attribute msg
onBodyLoaded msg =
    on "body-loaded" (Decode.map msg detailDecoder)


detailDecoder : Decoder Body
detailDecoder =
    Decode.at [ "detail", "body" ] bodyDecoder


bodyDecoder : Decoder Body
bodyDecoder =
    Decode.map3 Body
        (Decode.field "id" Decode.int)
        (Decode.field "mass" Decode.float)
        (Decode.field "position" vec3Decoder)


vec3Decoder : Decoder Vec3
vec3Decoder =
    Decode.map3 Vec3
        (Decode.field "x" Decode.float)
        (Decode.field "y" Decode.float)
        (Decode.field "z" Decode.float)
