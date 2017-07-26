import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Rectangle{
    width: 920
    height: parent.height
    //anchors.top: topRow.bottom
    Column {
        width: 920
        height: parent.height
        //anchors.top: topRow.bottom
        x:15
        Rectangle{
            width:parent.width
            height:240
            color:"white"
            ListView {
                id: listView
                width: parent.width
                height: 240
                clip: true
                model: mDatajson
                currentIndex:0
                delegate: Loader {
                    id: delegateLoader
                    width: listView.width
                    sourceComponent: swipeDelegateComponent

                    property ListView view: listView
                    property int ourIndex: index
                    property var jsonData: json

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
        }
        Text {
            width:100
            height: 70
            text:"参   数"
            font.pixelSize: 23
            verticalAlignment: Text.AlignVCenter
        }
        Grid {
            x:150
            y:30
            width: parent.width
            height: parent.height-listView.height-30
            columnSpacing: 150
            rowSpacing: 20
            rows: 5
            columns: 2

            Repeater {
                id:lrepeater
                model:ListModel{
                    id:lrepeatermodel
                    ListElement { name: "名 称";     len:70  ;test:"";unit:""}
                    ListElement { name: "上 模";     len:200 ;test:"";unit:""}
                    ListElement { name: "板 宽";     len:45  ;test:"" ;unit:" mm"}
                    ListElement { name: "下 模";     len:45  ;test:"";unit:""}
                    ListElement { name: "板 厚";     len:45  ;test:"";unit:" mm"}
                    ListElement { name: "上死点";    len:45  ;test:"";unit:" mm"}
                    ListElement { name: "材 料";     len:45  ;test:"";unit:""}
                    ListElement { name: "转速点";    len:45  ;test:"";unit:" mm"}
                    ListElement { name: "夹紧点";    len:45  ;test:"";unit:" mm"}
                }

                Rectangle{
                    width:300
                    height:30
                    color:mpane.color

                    Label {
                        id:firstname
                        width: 65
                        y:5
                        //text: jsonData.name
                        font.pixelSize: 18
                        //font.bold: true
                    }
                    TextField {
                        id:textname
                        width: 100
                        height: 35
                        placeholderText: "TextField"
                        anchors.left: firstname.right
                    }
                    Label{
                        id:originvalue
                        width:100
                        height:35
                        text:"   = "+index
                        font.pixelSize: 18
                        anchors.left: textname.right
                    }
                }
            }
        }
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
                Rectangle{
                    width: 10
                    height: 10
                    x:15
                    y:10
                    opacity:jsonData.draw==="1"?1:0
                    color: "green"
                }

                Text{
                    width:60
                    height: parent.height
                    text:jsonData.id//"1"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }
                Text{
                    width:200
                    height:parent.height
                    text:jsonData.name//"Bending Box one"
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:45
                    height:parent.height
                    text:jsonData.stepnum
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.widthness
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.thickness
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.material
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.topmould
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75
                    height:parent.height
                    text:jsonData.bottommould
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:70
                    height:parent.height
                    text:jsonData.workednum
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:160
                    height:parent.height
                    text:jsonData.edittime//"2017/6/26 17:30"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            MouseArea {
                id:mClickedArea
                anchors.fill: parent
                onClicked:{
                    listView.currentIndex = ourIndex;
                    console.log(ourIndex);
                    //setlrepeatermodel(jsonData)
                    //                listView.remove.objectName("id");
                    //                mDatajson.minsert(7);//mDatajson
                    //listView.update();
//                    for(var n;n<8;++n)
//                    {
                    mDatajson.setData(mDatajson.index(ourIndex,0),"fe",0)
//                    }
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
        }

    }


}
