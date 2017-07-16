/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
//import "qrc:/MaterialUI/"
//import "qrc:/MaterialUI/Interface/"

Page {
    id: m_page
    width: 1024//p_width; height: p_height;
    height: 700
//    property variant p_width
//    property variant p_height
    signal returnClicked(variant type);
    function log(message) {
        console.log(message);
    }

    Button{
        width:700
        height: 100
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "plugin test"
    }

//    header: ToolBar {
//        id:mToolbar

//        width: parent.width
//        height:parent.height/10-20
//        RowLayout {
//            spacing: 10
//            anchors.fill: parent
////            RectangularGlow {
////                x: 180
////                z: -1
////                width: parent.width - 180
////                height: 64
////                glowRadius: 5
////                spread: 0.22
////                color: "#30000000"
////                cornerRadius: 3
////            }

////            Rectangle {
////                z: 1
////                width: parent.width
////                height: 64
////                color: "#2196F3"

////                MaterialLabel {
////                    id: labelForCurrentItemTitleName
////                    x: 60
////                    z: 1
////                    height: 64
////                    font.pixelSize: 20
////                    verticalAlignment: Text.AlignVCenter
////                    horizontalAlignment: Text.Left
////                    color: "#ffffff"
////                }

////                MouseArea {
////                    anchors.fill: parent
////                    hoverEnabled: true

////                    onEntered: {
////                        labelForVersionString.opacity = 1;
////                    }

////                    onExited: {
////                        labelForVersionString.opacity = 0;
////                    }
////                }

////                MaterialLabel {
////                    id: labelForVersionString
////                    anchors.right: parent.right
////                    anchors.rightMargin: 5
////                    anchors.bottom: parent.bottom
////                    anchors.bottomMargin: 5
////                    text: "V" + JQToolsManage.jqToolsVersionString()
////                    color: "#88ffffff"
////                    opacity: 0

////                    Behavior on opacity { NumberAnimation { easing.type: Easing.InOutQuad; duration: 400 } }
////                }
////            }


//            ToolButton {
//                id:mbutton
//                Layout.preferredHeight: 60
//                //Layout.maximumWidth: 30
//                Layout.preferredWidth:  60
//                //Layout.maximumHeight: 30
//                Image {
//                    id:homeico
//                    fillMode: Image.Pad
//                    horizontalAlignment: Image.AlignHCenter
//                    verticalAlignment: Image.AlignVCenter
//                    source: "images/phome.png"
//                }

//                MouseArea{
//                    anchors.fill: parent
//                    onPressed: {
//                        homeico.source="images/home.png"
//                        mbutton.scale = 0.9
//                        //homeico.scale = 0.9
//                    }
//                    onReleased: {
//                        homeico.source="images/phome.png"
//                        //homeico.scale = 1
//                        mbutton.scale = 1
//                    }
//                    onClicked: {emit:returnClicked(1)}
//                }
//            }
//            Text{
//                anchors.horizontalCenter: parent.horizontalCenter
//                text:"折弯机程序库"
//                font.pixelSize: 30
//                font.bold: true
//                color:"black"
//            }
//        }
//        //        TextField {
//        //            id: searchBox

//        //            placeholderText: "Search..."
//        //            inputMethodHints: Qt.ImhNoPredictiveText

//        //            width: parent.width / 6
//        //            anchors.right: parent.right
//        //            anchors.verticalCenter: parent.verticalCenter
//        //        }
//    }


//    ListModel {
//        id: sourceModel
//        ListElement {
//            num:1
//            sum: 5
//            title: "Moby-Dick"
//            time:"2017/05/06"
//            //sum: 5
//        }
//        ListElement {
//            title: "The Adventures Tom"
//            num:2
//            sum: 3
//            time:"2017/03/26"
//        }
//        ListElement {
//            title: "Cat’s Cradle"
//            num:3
//            sum: 7
//            time:"2015/08/08"
//        }
//        ListElement {
//            title: "Farenheit 451"
//            num:4
//            sum: 10
//            time:"2017/12/16"
//        }
//        ListElement {
//            title: "It"
//            num:5
//            sum: 8
//            time:"2016/03/11"
//        }
//        ListElement {
//            title: "On the Road"
//            num:6
//            sum: 9
//            time:"2015/02/06"
//        }
//    }

//    Component.onCompleted:{
//        //numColumn.setAlignment(AlignCenter)
//    }

//    Row{
//        Mqsql{

//        }
//        Page{
//            width: m_page.width/2
//            height: m_page.height-mToolbar.height
//            ColumnLayout {
//                       spacing: 20
//                       anchors.horizontalCenter: parent.horizontalCenter

//                       Button {
//                           text: "First"
//                           Layout.fillWidth: true
//                       }
//                       Button {
//                           id: button
//                           text: "Second"
//                           highlighted: true
//                           Layout.fillWidth: true
//                       }
//                       Button {
//                           text: "Third"
//                           enabled: false
//                           Layout.fillWidth: true
//                       }
//                       BusyIndicator {
//                           anchors.horizontalCenter: parent.horizontalCenter
//                       }
//                   }

////            Rectangle{
////                anchors.fill: parent
////                //heigth:m_page.height
////                //color:"grey"
////            }
//        }
//    }

}


