import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0
//import Dataplugins 1.0
Rectangle {
    id: root
    width: p_width; height: p_height;
    property variant p_width
    property variant p_height
    property string ggp:"fef"
    //signal

    signal returnClicked(variant type);

    //function

    function log(message) {
        console.log(message);
    }

    Component.onCompleted:{
        //numColumn.setAlignment(AlignCenter)
        //log(p_page)

    }
    Column{
        anchors.fill:parent

        Rectangle{
            id:topRec
            width: parent.width
            height: 60
            color:"#f2f1f0"
            Text{
                text:"工序"
                font.pixelSize: 25
                x:20
                y:20
            }
        }

        Row{
            width: parent.width
            height: parent.height-topRec.height
            Rectangle{
                width: parent.width-80
                height: parent.height
                //color:"black"//"#f2f1f0"
//                Datalist{
//                    //visible: p_page===0?true:false

//                }
                Datasteplist{
                    //visible: p_page===0?false:true
                }
            }
            Rectangle{
                width: 80
                height: parent.height
                color:"#f2f1f0"
                ColumnLayout{
                    x:10
                    y:10
                    spacing:10
                    ToolButton {
                        Image{
                            width:50
                            height:width
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "./png/P2-UP.png"
                        }
                        onClicked:{


                        }
                        style: ButtonStyle{
                            background: Rectangle {
                                implicitWidth: 55
                                implicitHeight: 55
                                border.width: control.activeFocus ? 2 : 1
                                border.color: "#888"
                                radius: 4

                                gradient: Gradient {
                                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                }
                            }
                        }
                    }
                    Repeater {
                        model: ListModel {
                            id: listModel
                            ListElement { title: "新建";   source: "./png/new.png" }
                            ListElement { title: "删除";   source: "./png/delete.png" }
                            ListElement { title: "复制";   source: "./png/copy.png" }
                            //ListElement { title: "粘贴";   source: "P1-MANUmini.png" }
                        }

                        ToolButton {
                            id:titleRect
                            Image {
                                id: toolico
                                source: model.source
                                y:3
                                width:35
                                height:35
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text{
                                id:listtitle
                                anchors.horizontalCenter: parent.horizontalCenter
                                //anchors.verticalCenter: parent.verticalCenter
                                anchors.top:toolico.bottom
                                text:model.title
                                font.pixelSize: 12
                                color: 'black'
                            }
                            onClicked:{

                            }
                            style: ButtonStyle{
                                background: Rectangle {
                                    implicitWidth: 55
                                    implicitHeight: 55
                                    border.width: control.activeFocus ? 2 : 1
                                    border.color: "#888"
                                    radius: 4

                                    gradient: Gradient {
                                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                    }
                                }
                            }
                        }
                    }
                    ToolButton {
                        Image{
                            width:50
                            height:width
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "./png/P2-DOWN.png"
                        }
                        onClicked:{

                        }
                        style: ButtonStyle{
                            background: Rectangle {
                                implicitWidth: 55
                                implicitHeight: 55
                                border.width: control.activeFocus ? 2 : 1
                                border.color: "#888"
                                radius: 4

                                gradient: Gradient {
                                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
