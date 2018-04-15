module AFrame.Core.Image
    exposing
        ( image
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
