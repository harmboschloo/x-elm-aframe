module AFrame.Core.Image.Value
    exposing
        ( Image
        , image
        , id
        , idSelector
        , url
        )

import AFrame.Core exposing (Supported)
import AFrame.Core.Value exposing (Value, value, map)


type alias Image providesId providesUrl providesSelector =
    { id : Value { providesId | imageId : Supported }
    , url : Value { providesUrl | imageUrl : Supported }
    , selector : Value { providesSelector | imageSelector : Supported }
    }


image :
    { id : String, url : String }
    -> Image providesId providesUrl providesSelector
image { id, url } =
    { id = value id
    , url = value url
    , selector = value ("#" ++ id)
    }


id : String -> Value { provides | imageId : Supported }
id =
    value


idSelector :
    Value { imageId : Supported }
    -> Value { provides | imageSelector : Supported }
idSelector =
    map (String.append "#")


url : String -> Value { provides | imageUrl : Supported }
url =
    value
