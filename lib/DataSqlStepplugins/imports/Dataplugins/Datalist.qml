import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

//Pane{
Rectangle{
    id:mpane
    anchors.fill: parent
    color: "#f2f1f0"
    property int mwidth:920
    ListModel {
        id:headerModel
        ListElement { name: "序号";     len:70;  b_id:"header1"  }
        ListElement { name: "名   称";  len:200; b_id:"header2"  }
        ListElement { name: "步数";     len:45;  b_id:"header3"  }
        ListElement { name: "板宽";     len:75;  b_id:"header4"  }
        ListElement { name: "板厚";     len:75;  b_id:"header5"  }
        ListElement { name: "材料";     len:75;  b_id:"header6"  }
        ListElement { name: "上模";     len:75;  b_id:"header7"  }
        ListElement { name: "下模";     len:75 ; b_id:"header8"  }
        ListElement { name: "已加工数";  len:70;  b_id:"header9"  }
        ListElement { name: "编辑时间";  len:160; b_id:"header10" }
    }
    Component {
        id: swipeDelegateComponent
        Rectangle {
            id: swipeDelegate
            height: 30
            width: mwidth
            color: listView.currentIndex==ourIndex?"lightblue":"#ffffff" //选中颜色设置
            border.color: Qt.lighter(color, 1.1)

                Row{
                    //width: parent.width
                    anchors.fill: parent
                    spacing: 0
                    //                    Rectangle{
                    //                        width: headerModel.get(0).len
                    //                        height: parent.height
                    Rectangle{
                        //id:paintPro
                        width: 10
                        height: 10
                        x:15
                        y:10
                        color: "green"
                    }

                    Text{
                        width:60
                        height: parent.height
                        text:"102"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 16
                    }
                    //                    }
                    Text{
                        width:200
                        height:parent.height
                        text:"Bending Box one"
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text{
                        width:45
                        height:parent.height
                        text:"5"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text{
                        width:75//repeater.itemAt(3).width
                        height:parent.height
                        text:"200.00"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text{
                        width:75//repeater.itemAt(3).width
                        height:parent.height
                        text:"5.77"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text{
                        width:75//repeater.itemAt(3).width
                        height:parent.height
                        text:"铝合金"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text{
                        width:75//repeater.itemAt(3).width
                        height:parent.height
                        text:"s-01"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text{
                        width:75
                        height:parent.height
                        text:"xd=3"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text{
                        width:70
                        height:parent.height
                        text:"100"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text{
                        width:160
                        height:parent.height
                        text:"2017/6/26 17:30"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                MouseArea {
                anchors.fill: parent
                onClicked:{listView.currentIndex = ourIndex  //实现item切换
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
            width: parent.width
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
            text:"参   数"
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
                rows:5
                columns: 2

                Repeater {
                    id:lrepeater
                    model:ListModel{
                    ListElement { name: "名 称";     len:70  }
                    ListElement { name: "上 模";     len:200 }
                    ListElement { name: "板 宽";     len:45  }
                    ListElement { name: "下 模";     len:45  }
                    ListElement { name: "板 厚";     len:45  }
                    ListElement { name: "上死点";   len:45  }
                    ListElement { name: "材 料";     len:45  }
                    ListElement { name: "转速点";   len:45  }
                    ListElement { name: "";         len:45  }
                    ListElement { name: "夹紧点";    len:45  }
                    }
                    Rectangle{
                        width:160
                        height:30
                        color:mpane.color
                        Label {
                            id:firstname
                            width: 65
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
