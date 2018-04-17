module AFrame.Core.Image
    exposing
        ( image
        , imageOf
        , id
        , src
        )

import AFrame.Core exposing (Supported, Node, Attribute, node, attribute)
import AFrame.Core.Value as Value exposing (Value)


image :
    List
        (Attribute
            { any : Supported
            , imageId : Supported
            , imageSrc : Supported
            }
            msg
        )
    -> Node { provides | image : Supported } msg
image attributes =
    node "img" attributes []


imageOf :
    { a
        | id : Value { imageId : Supported }
        , url : Value { imageUrl : Supported }
    }
    -> Node { provides | image : Supported } msg
imageOf data =
    image [ id data.id, src data.url ]


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
