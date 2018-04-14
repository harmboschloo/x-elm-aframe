module AFrame.Components.Geometry
    exposing
        ( geometry
        , Primitive
        , GeometryProperty
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

import AFrame exposing (Attribute, Property, Supported, Component, component)
import AFrame.Properties as Properties


geometry :
    Primitive a
    -> List (GeometryProperty a)
    -> Component b msg
geometry (Primitive primitive) properties =
    component "geometry" (Properties.string "primitive" primitive :: properties)


type Primitive supports
    = Primitive String


type alias GeometryProperty a =
    Property
        { a
            | buffer : Supported
            , skipCache : Supported
        }



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


width : number -> Property { a | width : Supported }
width =
    Properties.number "width"


height : number -> Property { a | height : Supported }
height =
    Properties.number "height"


depth : number -> Property { a | depth : Supported }
depth =
    Properties.number "depth"


radius : number -> Property { a | radius : Supported }
radius =
    Properties.number "radius"


segmentsWidth : Int -> Property { a | segmentsWidth : Supported }
segmentsWidth =
    Properties.number "segmentsWidth"


segmentsHeight : Int -> Property { a | segmentsHeight : Supported }
segmentsHeight =
    Properties.number "segmentsHeight"


segmentsDepth : Int -> Property { a | segmentsDepth : Supported }
segmentsDepth =
    Properties.number "segmentsDepth"


segmentsRadial : Int -> Property { a | segmentsRadial : Supported }
segmentsRadial =
    Properties.number "segmentsRadial"


openEnded : Bool -> Property { a | openEnded : Supported }
openEnded =
    Properties.bool "openEnded"


thetaStart : number -> Property { a | thetaStart : Supported }
thetaStart =
    Properties.number "thetaStart"


thetaLength : number -> Property { a | thetaLength : Supported }
thetaLength =
    Properties.number "thetaLength"
