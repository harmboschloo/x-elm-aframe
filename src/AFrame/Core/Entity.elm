module AFrame.Core.Entity
    exposing
        ( EntityAttribute
        , EntityNode
        , entity
        , primitive
        , component
        , componentSingle
        , id
        , mixin
        , idValue
        , idSelector
        )

{-| see <https://aframe.io/docs/0.8.0/core/entity.html>
-}

import AFrame.Core exposing (Supported, Node, Attribute, node, attribute)
import AFrame.Core.Property as Property exposing (Property)
import AFrame.Core.Value as Value exposing (Value)


-- Node


type alias EntityAttribute accepts msg =
    Attribute
        { accepts
            | any : Supported
            , component : Supported
            , id : Supported
            , mixin : Supported
        }
        msg


type alias EntityNode msg =
    Node
        { any : Supported
        , animation : Supported
        , entity : Supported
        }
        msg


entity :
    List (EntityAttribute {} msg)
    -> List (EntityNode msg)
    -> Node { provides | entity : Supported } msg
entity =
    node "a-entity"


primitive :
    String
    -> List (EntityAttribute accepts msg)
    -> List (EntityNode msg)
    -> Node { provides | entity : Supported } msg
primitive =
    node



-- Attributes


component :
    String
    -> List (Property accepts)
    -> Attribute { provides | component : Supported } msg
component name properties =
    properties
        |> List.map Property.toString
        |> String.join ";"
        |> attribute name


componentSingle :
    String
    -> String
    -> Attribute { provides | component : Supported } msg
componentSingle =
    attribute


id : Value { id : Supported } -> Attribute { provides | id : Supported } msg
id =
    Value.toString >> attribute "id"


mixin :
    List (Value { mixinId : Supported })
    -> Attribute { provides | mixin : Supported } msg
mixin =
    List.map Value.toString >> String.join " " >> attribute "mixin"



-- Values


idValue : String -> Value { provides | id : Supported }
idValue =
    Value.value


idSelector :
    Value { id : Supported }
    -> Value { provides | selector : Supported }
idSelector =
    Value.map (String.append "#")
