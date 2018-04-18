module AFrame.Core.Image
    exposing
        ( image
        , imageOf
        , crossOrigin
        , id
        , src
        , anonymous
        )

import AFrame.Core exposing (Supported, Node, Attribute, node, attribute)
import AFrame.Core.Value as Value exposing (Value, value)


-- Node


type alias ImageAttributes =
    { any : Supported
    , crossOrigin : Supported
    , imageId : Supported
    , imageSrc : Supported
    }


image :
    List (Attribute ImageAttributes msg)
    -> Node { provides | image : Supported } msg
image attributes =
    node "img" attributes []


imageOf :
    { a
        | id : Value { imageId : Supported }
        , url : Value { imageUrl : Supported }
    }
    -> List (Attribute ImageAttributes msg)
    -> Node { provides | image : Supported } msg
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


anonymous : Value { provides | anonymous : Supported }
anonymous =
    value "anonymous"
