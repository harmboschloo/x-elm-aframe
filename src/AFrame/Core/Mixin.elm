module AFrame.Core.Mixin
    exposing
        ( mixin
        , id
        )

import AFrame.Core exposing (Supported, Node, Attribute, node, attribute)
import AFrame.Core.Value as Value exposing (Value, value)


mixin :
    Value { mixinId : Supported }
    -> List (Attribute { component : Supported } msg)
    -> Node { provides | mixin : Supported } msg
mixin id attributes =
    node "a-mixin" (attribute "id" (Value.toString id) :: attributes) []


id : String -> Value { mixinId : Supported }
id =
    value
