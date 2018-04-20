module XAFrame.Core.Mixin
    exposing
        ( mixin
        , id
        )

{-| <https://aframe.io/docs/0.8.0/core/mixins.html>
-}

import XAFrame.Core exposing (Supported, Html, Attribute, node, attribute)
import XAFrame.Core.Value as Value exposing (Value, value)


mixin :
    Value { mixinId : Supported }
    -> List (Attribute { component : Supported } msg)
    -> Html { provides | mixin : Supported } msg
mixin id attributes =
    node "a-mixin" (attribute "id" (Value.toString id) :: attributes) []


id : String -> Value { mixinId : Supported }
id =
    value
