module AFrame.Core.Image
    exposing
        ( image
        , imageOf
        , id
        , src
        )

import AFrame.Core
    exposing
        ( Supported
        , Node
        , NodeAttribute
        , ChildNode
        , Attribute
        , Value
        , node
        , valueAttribute
        )
import AFrame.Core.Values exposing (Image)


image :
    List
        (NodeAttribute
            { imageId : Supported
            , imageSrc : Supported
            }
            msg
        )
    -> Node { provides | image : Supported } msg
image attributes =
    node "img" attributes []


imageOf : Image {} {} {} -> Node { provides | image : Supported } msg
imageOf data =
    image [ id data.id, src data.url ]


id :
    Value { imageId : Supported }
    -> Attribute { provides | imageId : Supported } msg
id =
    valueAttribute "id"


src :
    Value { imageUrl : Supported }
    -> Attribute { provides | imageSrc : Supported } msg
src =
    valueAttribute "src"
