module XKFrame.Components.Snap
    exposing
        ( snap
        , offset
        , spacing
        )

{-| see <https://github.com/ngokevin/kframe/blob/master/scenes/aincraft/components/snap.js>
-}

import XAFrame.Core exposing (Supported, Attribute)
import XAFrame.Core.Entity exposing (component)
import XAFrame.Core.Property exposing (Property, property)
import XAFrame.Core.Value as Value


snap :
    List (Property { offset : Supported, spacing : Supported })
    -> Attribute { provides | component : Supported } msg
snap properties =
    component "snap" properties


offset :
    number
    -> number
    -> number
    -> Property { provides | offset : Supported }
offset x y z =
    property "offset" (Value.vec3ToString x y z)


spacing :
    number
    -> number
    -> number
    -> Property { provides | spacing : Supported }
spacing x y z =
    property "snap" (Value.vec3ToString x y z)
