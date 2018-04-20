module XAFrame.Core.Image
    exposing
        ( Props
        , image
        , imageOf
        , crossOrigin
        , id
        , src
        , anonymous
        , idValue
        , idSelector
        , props
        )

{-| <https://aframe.io/docs/0.8.0/core/asset-management-system.html>
-}

import XAFrame.Core exposing (Supported, Html, Attribute, node, attribute)
import XAFrame.Core.Value as Value exposing (Value, value)


-- Html


type alias ImageAttributes =
    { any : Supported
    , crossOrigin : Supported
    , imageId : Supported
    , imageSrc : Supported
    }


image :
    List (Attribute ImageAttributes msg)
    -> Html { provides | image : Supported } msg
image attributes =
    node "img" attributes []


imageOf :
    { a
        | id : Value { imageId : Supported }
        , url : Value { imageUrl : Supported }
    }
    -> List (Attribute ImageAttributes msg)
    -> Html { provides | image : Supported } msg
imageOf data attributes =
    image ([ id data.id, src data.url ] ++ attributes)



-- Attributes


crossOrigin :
    Value { anonymous : Supported }
    -> Attribute { provides | crossOrigin : Supported } msg
crossOrigin =
    Value.toString >> attribute "crossorigin"


id :
    Value { imageId : Supported }
    -> Attribute { provides | imageId : Supported } msg
id =
    Value.toString >> attribute "id"


src :
    Value { imageUrl : Supported }
    -> Attribute { provides | imageSrc : Supported } msg
src =
    Value.toString >> attribute "src"



-- Values


type alias Props providesId providesUrl providesSelector =
    { id : Value { providesId | imageId : Supported }
    , url : Value { providesUrl | imageUrl : Supported }
    , selector : Value { providesSelector | imageSelector : Supported }
    }


anonymous : Value { provides | anonymous : Supported }
anonymous =
    value "anonymous"


idValue : String -> Value { provides | imageId : Supported }
idValue =
    value


idSelector :
    Value { imageId : Supported }
    -> Value { provides | imageSelector : Supported }
idSelector =
    Value.map (String.append "#")


props :
    { id : String, url : String }
    -> Props providesId providesUrl providesSelector
props { id, url } =
    { id = value id
    , url = value url
    , selector = value ("#" ++ id)
    }
