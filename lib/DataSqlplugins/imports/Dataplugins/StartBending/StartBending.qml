import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0

Rectangle {
    id: root
    width: p_width; height: p_height;
//    property variant p_width
//    property variant p_height
    property string g_y1Data:"200.0"
    property string g_y1Data1:"255.0"
    property string g_y2Data:"200.1"
    property string g_y2Data1:"255.1"
    property string g_xData:"10.0"
    property string g_xData1:"20.0"
    property string g_rData:"8.0"
    property string g_rData1:"10.0"
    property string g_BendName: "P3"
    property string g_BendNumTotal: "10"
    property string g_BendNumFinish: "0"
    property string g_StepTotal: "5"
    property string g_StepFinish: "1"


    color: "#9F9EA3"


    Component {
        id: dataComponent

        Rectangle{
            id:dataComponent1

            height: 100
            width: 620
            color: "#00000000"


            Row{
                anchors.fill: parent
                spacing: 30
                Text{
                    id:textName
                    width:100
                    height: parent.height
                    text:sName
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 30
                    font.bold: true
                    font.family: "仿宋"
                    color: "#565E83"
                }
                Text{
                    id:textCurData
                    width:170
                    height:parent.height
                    //text:"200.13"
                    text:curData
                    font.pixelSize: 50
                    font.bold: true
                    font.family: "仿宋"
                    color: "#0E173A"
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignHCenter
                }
                Text{
                    id:textDesData
                    width:150
                    height:parent.height
                    text:desData
                    font.pixelSize: 25
                    color: "#565E83"
                    font.bold: true
                    font.family: "仿宋"
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignLeft
                }
            }
        }
    }

    Column{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/50


        Row{
            id:uplay
            anchors.left: parent.left
            anchors.top:parent.top
            anchors.right: parent.right
            height: parent.height/6
            //spacing: 16
            anchors.bottomMargin: 8
            DropShadow{
                anchors.fill: logo
                radius: 12
                horizontalOffset: 0
                verticalOffset: 0
                samples: 25
                color: "lightblue"
                source: logo
                spread: 0
            }
            Rectangle{
                id:logo
                anchors.left: parent.left
                anchors.top:parent.top
                width: parent.width/5*3
                height: parent.height
                radius: 8
                anchors.leftMargin: 8
                // anchors.rightMargin: 8
                anchors.topMargin:8
                anchors.bottomMargin: 8
                gradient: Gradient{
                    GradientStop{position: 0;color: "#FCFCFC"}
                    GradientStop{position: 1;color: "#D4D4D4"}
                }
                Text{
                    //anchors.fill: parent
                    width: parent.width-20
                    // anchors.left: parent.left
                    x:20
                    anchors.top:parent.top
                    anchors.bottom: parent.bottom
                    id:testLogo
                    text:"GB.Touch"
                    font.pixelSize: 60
                    font.bold: true
                    font.family: "仿宋"
                    color: "#565E83"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }
            }
            Rectangle{
                id:status
                anchors.right: parent.right
                anchors.top:parent.top
                anchors.left: logo.right
                height: parent.height
                radius: 8
                anchors.leftMargin: 6
                anchors.rightMargin: 8
                anchors.topMargin:8
                anchors.bottomMargin: 8
                gradient: Gradient{
                    GradientStop{position: 0;color: "#FCFCFC"}
                    GradientStop{position: 1;color: "#D4D4D4"}
                }
                Row{
                    Column{
                        Text{
                            id:textState
                            width:status.width/2
                            height: status.height/2
                            text:"停止"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 25
                            font.bold: true
                            font.family: "仿宋"
                            color: "#565E83"
                        }
                        Text{
                            id:textSpeed
                            width:status.width/2
                            height: status.height/2
                            text:"0 m/s"
                            font.pixelSize: 25
                            font.bold: true
                            font.family: "仿宋"
                            color: "#565E83"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                    Text{
                        id:textTime
                        width:status.width/2-10
                        height: status.height
                        text:"19:20:23"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.pixelSize: 30
                        font.bold: true
                        font.family: "仿宋"
                        color: "#565E83"
                    }
                }

            }
        }

        Rectangle{
            id:databack
            anchors.right: parent.right
            anchors.top:uplay.bottom
            anchors.left: parent.left
            anchors.bottom:parent.bottom
            anchors.leftMargin:8
            anchors.rightMargin: 8
            anchors.topMargin:16
            radius: 8
            gradient: Gradient{
                GradientStop{position: 0;color: "#D6D4DE"}
                GradientStop{position: 1;color: "#B0A7B7"}
            }




            Row{
                width: parent.width
                height: parent.height
                //                anchors.fill: parent
                //                Rectangle{
                //                    width: 620
                //                    height: parent.height
                Column{
                    //width: parent.width/5*3
                    //height: parent.height
                    anchors.fill: parent
                    anchors.topMargin: 20
                    anchors.bottomMargin: 40
                    anchors.leftMargin: 40
                    spacing: 10

                    Row{
                        Text{
                            id:textBendName
                            x:10
                            width:100
                            height: (databack.height-140)/4
                            text:g_BendName
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            font.pixelSize: 60
                            font.bold: true
                            font.family: "仿宋"
                            color: "#0E173A"
                        }
                        Text{
                            id:textBendNum
                            width:200
                            height: (databack.height-140)/4
                            text:g_BendNumFinish+"/"+g_BendNumTotal+" 件"
                            font.pixelSize: 30
                            font.bold: true
                            font.family: "仿宋"
                            color: "#565E83"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                        Text{
                            id:textStepNum
                            width:200
                            height: (databack.height-140)/4
                            text:g_StepFinish+"/"+g_StepTotal+" 步"
                            font.pixelSize: 30
                            color: "#565E83"
                            font.bold: true
                            font.family: "仿宋"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }

                    }


                    Loader{
                        id:y1Loader
                        //.left: parent.left+300
                        // anchors.top: parent.top+100
                        height: (databack.height-140)/5
                        sourceComponent: dataComponent
                        property string sName:"Y1"
                        property string curData:g_y1Data
                        property string desData:g_y1Data1
                        //                      onLoaded: {
                        //                        item.color="red"
                        //                        item.sS = "1235"

                        //                      }
                    }
                    Loader{
                        id:y2Loader

                        height: (databack.height-140)/5
                        sourceComponent: dataComponent
                        property string sName:"Y2"
                        property string curData:g_y2Data
                        property string desData:g_y2Data1
                        //                      onLoaded: {
                        //                        item.color="red"
                        //                        item.sS = "123"
                        //                      }
                    }
                    Loader{
                        id:xLoader
                        height: (databack.height-140)/5
                        sourceComponent: dataComponent
                        property string sName:"X"
                        property string curData:g_xData
                        property string desData:g_xData1
                    }
                    Loader{
                        id:rLoader
                        height: (databack.height-140)/5
                        sourceComponent: dataComponent
                        property string sName:"R"
                        property string curData:g_rData
                        property string desData:g_rData1
                    }
                }
            }

        }
    }


    //signal

    //function

    function log(message) {
        console.log(message);
    }

}
