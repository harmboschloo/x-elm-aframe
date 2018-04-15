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

import AFrame
    exposing
        ( Supported
        , Attribute
        , Component
        , Property
        , component
        , property
        )
import AFrame.Values as Values


geometry :
    Primitive accepts
    -> List (GeometryProperty accepts)
    -> Component provides msg
geometry (Primitive primitive) properties =
    component "geometry" (property "primitive" primitive :: properties)


type Primitive accepts
    = Primitive String


type alias GeometryProperty accepts =
    Property
        { accepts
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


width : number -> Property { provides | width : Supported }
width =
    Values.number >> property "width"


height : number -> Property { provides | height : Supported }
height =
    Values.number >> property "height"


depth : number -> Property { provides | depth : Supported }
depth =
    Values.number >> property "depth"


radius : number -> Property { provides | radius : Supported }
radius =
    Values.number >> property "radius"


segmentsWidth : Int -> Property { provides | segmentsWidth : Supported }
segmentsWidth =
    Values.number >> property "segmentsWidth"


segmentsHeight : Int -> Property { provides | segmentsHeight : Supported }
segmentsHeight =
    Values.number >> property "segmentsHeight"


segmentsDepth : Int -> Property { provides | segmentsDepth : Supported }
segmentsDepth =
    Values.number >> property "segmentsDepth"


segmentsRadial : Int -> Property { provides | segmentsRadial : Supported }
segmentsRadial =
    Values.number >> property "segmentsRadial"


openEnded : Bool -> Property { provides | openEnded : Supported }
openEnded =
    Values.bool >> property "openEnded"


thetaStart : number -> Property { provides | thetaStart : Supported }
thetaStart =
    Values.number >> property "thetaStart"


thetaLength : number -> Property { provides | thetaLength : Supported }
thetaLength =
    Values.number >> property "thetaLength"
