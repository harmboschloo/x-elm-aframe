module AFrame.Components.Geometry
    exposing
        ( Primitive
        , GeometryProperty
        , geometry
        , box
        , cylinder
        , width
        , height
        , depth
        , radius
        , segmentsWidth
        , segmentsHeight
        , segmentsDepth
        , segmentsRadial
        , openEnded
        , thetaStart
        , thetaLength
        )

{-| see <https://aframe.io/docs/0.8.0/components/geometry.html>
-}

import AFrame.Core exposing (Supported, Attribute)
import AFrame.Core.Entity exposing (component)
import AFrame.Core.Property exposing (Property, property)
import AFrame.Core.Value exposing (booleanToString)


type Primitive accepts
    = Primitive String


type alias GeometryProperty accepts =
    Property
        { accepts
            | buffer : Supported
            , skipCache : Supported
        }


geometry :
    Primitive accepts
    -> List (GeometryProperty accepts)
    -> Attribute { provides | component : Supported } msg
geometry (Primitive primitive) properties =
    component "geometry" (property "primitive" primitive :: properties)



-- PRIMITIVES


box :
    Primitive
        { width : Supported
        , height : Supported
        , depth : Supported
        , segmentsWidth : Supported
        , segmentsHeight : Supported
        , segmentsDepth : Supported
        }
box =
    Primitive "box"


cylinder :
    Primitive
        { radius : Supported
        , height : Supported
        , segmentsRadial : Supported
        , segmentsHeight : Supported
        , openEnded : Supported
        , thetaStart : Supported
        , thetaLength : Supported
        }
cylinder =
    Primitive "cylinder"



-- PROPERTIES


width : number -> Property { provides | width : Supported }
width =
    toString >> property "width"


height : number -> Property { provides | height : Supported }
height =
    toString >> property "height"


depth : number -> Property { provides | depth : Supported }
depth =
    toString >> property "depth"


radius : number -> Property { provides | radius : Supported }
radius =
    toString >> property "radius"


segmentsWidth : Int -> Property { provides | segmentsWidth : Supported }
segmentsWidth =
    toString >> property "segmentsWidth"


segmentsHeight : Int -> Property { provides | segmentsHeight : Supported }
segmentsHeight =
    toString >> property "segmentsHeight"


segmentsDepth : Int -> Property { provides | segmentsDepth : Supported }
segmentsDepth =
    toString >> property "segmentsDepth"


segmentsRadial : Int -> Property { provides | segmentsRadial : Supported }
segmentsRadial =
    toString >> property "segmentsRadial"


openEnded : Bool -> Property { provides | openEnded : Supported }
openEnded =
    booleanToString >> property "openEnded"


thetaStart : number -> Property { provides | thetaStart : Supported }
thetaStart =
    toString >> property "thetaStart"


thetaLength : number -> Property { provides | thetaLength : Supported }
thetaLength =
    toString >> property "thetaLength"
