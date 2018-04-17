module AFrame.Core.Entity.Value
    exposing
        ( id
        , idSelector
        )

import AFrame.Core exposing (Supported)
import AFrame.Core.Value exposing (Value, value, map)


id : String -> Value { provides | id : Supported }
id =
    value


idSelector :
    Value { id : Supported }
    -> Value { provides | selector : Supported }
idSelector =
    map (String.append "#")
