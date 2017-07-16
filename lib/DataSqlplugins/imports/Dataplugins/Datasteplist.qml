import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Rectangle{
    id:mpane
    anchors.fill: parent
    color: "#f2f1f0"
    property int mwidth:920
    ListModel {
        id:headerModel
        ListElement { name: "工步号";     len:70;  b_id:"header1"  }
        ListElement { name: "角度";       len:80; b_id:"header2"  }
        ListElement { name: "校正值";     len:80;  b_id:"header3"  }
        ListElement { name: "L";     len:80;  b_id:"header4"  }
        ListElement { name: "X";     len:80;  b_id:"header5"  }
        ListElement { name: "R";     len:80;  b_id:"header6"  }
        ListElement { name: "退让距离";     len:80;  b_id:"header7"  }
    }
    Component {
        id: swipeDelegateComponent
        Rectangle {
            id: swipeDelegate
            height: 30
            width: mwidth
            color: listView.currentIndex==ourIndex?"lightblue":"#ffffff"
            border.color: Qt.lighter(color, 1.1)

                Row{
                    anchors.fill: parent
                    spacing: 0
                    Text{
                        width:70
                        height: parent.height
                        text:"1"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 16
                    }
                    Text{
                        width:80
                        height:parent.height
                        text:"90"
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text{
                        width:80
                        height:parent.height
                        text:"1.5"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text{
                        width:80
                        height:parent.height
                        text:"100"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text{
                        width:80
                        height:parent.height
                        text:"110"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text{
                        width:80//repeater.itemAt(3).width
                        height:parent.height
                        text:"20"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text{
                        width:80//repeater.itemAt(3).width
                        height:parent.height
                        text:"180"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
          }
                MouseArea {
                anchors.fill: parent
                onClicked:{listView.currentIndex = ourIndex
                     console.log(ourIndex);
                }
                }
            //}
            //onClicked: if (swipe.complete) view.model.remove(ourIndex)

            Component {
                id: removeComponent

                Rectangle {
                    color: SwipeDelegate.pressed ? "#333" : "#444"
                    width: parent.width
                    height: parent.height
                    clip: true

                    Label {
                        font.pixelSize: swipeDelegate.font.pixelSize
                        text: "Remove"
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
            }

//            swipe.left: removeComponent
//            swipe.right: removeComponent
        }
    }

    Row{
        id:topRow
        width:mwidth
        height: 37
        x:15
        Repeater {
            id:repeater
            model:headerModel
            Button{
                width:len
                height:parent.height
                text:name
                font.pixelSize: 13
                //font.bold: true
                //highlighted: true
            }
        }
    }


    Column {
        id: column
        //spacing: 0
        width: 920
        height: parent.height
        x:15
        anchors.top: topRow.bottom
        //        anchors.fill: parent
        //        anchors.leftMargin: 15
        ListView {
            id: listView
            width: 550
            height: 180
            //            Layout.fillWidth: true
            //            Layout.fillHeight: true
            clip: true
            model: ListModel {
                ListElement { type: "ItemDelegate"; text: "ItemDelegate"}
                ListElement { type: "ItemDelegate"; text: "ItemDelegate" }
                ListElement { type: "ItemDelegate"; text: "ItemDelegate" }
                ListElement { type: "SwipeDelegate"; text: "SwipeDelegate" }
                ListElement { type: "SwipeDelegate"; text: "SwipeDelegate" }
                ListElement { type: "SwipeDelegate"; text: "SwipeDelegate" }
                ListElement { type: "CheckDelegate"; text: "CheckDelegate" }
                ListElement { type: "CheckDelegate"; text: "CheckDelegate" }
                ListElement { type: "CheckDelegate"; text: "CheckDelegate" }
                ListElement { type: "RadioDelegate"; text: "RadioDelegate" }
                ListElement { type: "RadioDelegate"; text: "RadioDelegate" }
                ListElement { type: "RadioDelegate"; text: "RadioDelegate" }
                ListElement { type: "SwitchDelegate"; text: "SwitchDelegate" }
                ListElement { type: "SwitchDelegate"; text: "SwitchDelegate" }
                ListElement { type: "SwitchDelegate"; text: "SwitchDelegate" }
            }

            //                section.property: "type"
            //                section.delegate: Pane {
            //                    width: listView.width
            //                    height: sectionLabel.implicitHeight + 20

            //                    Label {
            //                        id: sectionLabel
            //                        text: section
            //                        anchors.centerIn: parent
            //                    }
            //                }

            delegate: Loader {
                id: delegateLoader
                width: listView.width
                sourceComponent: swipeDelegateComponent

                property string labelText: text
                property ListView view: listView
                property int ourIndex: index

                // Can't find a way to do this in the SwipeDelegate component itself,
                // so do it here instead.
                ListView.onRemove: SequentialAnimation {
                    PropertyAction {
                        target: delegateLoader
                        property: "ListView.delayRemove"
                        value: true
                    }
                    NumberAnimation {
                        target: item
                        property: "height"
                        to: 0
                        easing.type: Easing.InOutQuad
                    }
                    PropertyAction {
                        target: delegateLoader
                        property: "ListView.delayRemove"
                        value: false
                    }
                }
            }
        }
        Text {
            width:100
            height: 50
            text:"工 步 参 数"
            font.pixelSize: 23
            //font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

            Grid {
                x:150
                y:30
                width: parent.width
                height: parent.height-listView.height-30
                columnSpacing: 150
                rowSpacing: 20
                //anchors.horizontalCenter: parent.horizontalCenter
                rows:6
                columns: 2

                Repeater {
                    id:lrepeater
                    model:ListModel{
                    ListElement { name: "角 度";     len:70  }
                    ListElement { name: "L";     len:200 }
                    ListElement { name: "角度校正";     len:45  }
                    ListElement { name: "X";     len:45  }
                    ListElement { name: "Y1";     len:45  }
                    ListElement { name: "X校正";   len:45  }
                    ListElement { name: "Y2";     len:45  }
                    ListElement { name: "R";   len:45  }
                    ListElement { name: "压 力";         len:45  }
                    ListElement { name: "R校正";    len:45  }
                    ListElement { name: "补 偿";    len:45  }
                    ListElement { name: "退让距离";    len:45  }
                    }
                    Rectangle{
                        width:160
                        height:30
                        color:mpane.color
                        Label {
                            id:firstname
                            width: 80
                            y:5
                            //wrapMode: Label.Wrap
                            //horizontalAlignment: Qt.AlignHCenter
                            text: name
                            font.pixelSize: 18
                            //font.bold: true
                        }
                        TextField {
                            width: 100
                            height: 35
                            placeholderText: "TextField"
                            //anchors.horizontalCenter: parent.horizontalCenter
                            anchors.left: firstname.right
                        }

                    }

                }



            }



    }
}
