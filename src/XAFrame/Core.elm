module XAFrame.Core
    exposing
        ( Supported
        , Node
        , Attribute
        , node
        , toHtml
        , attribute
        )

{-| see <https://aframe.io/docs/0.8.0/introduction/>
-}

import Html
import Html.Attributes


type Supported
    = Supported


type Node supports msg
    = Node (Html.Html msg)


type Attribute supports msg
    = Attribute String String


node :
    String
    -> List (Attribute acceptsAttribute msg)
    -> List (Node acceptsNode msg)
    -> Node provides msg
node name attributes children =
    Node <|
        Html.node name
            (List.map toHtmlAttribute attributes)
            (List.map toHtml children)


toHtml : Node supports msg -> Html.Html msg
toHtml (Node html) =
    html


toHtmlAttribute : Attribute supports msg -> Html.Attribute msg
toHtmlAttribute (Attribute name value) =
    Html.Attributes.attribute name value


attribute : String -> String -> Attribute provides msg
attribute name value =
    Attribute name value
