import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Window 2.1

Page {
    id: root
    width:p_width
    height:p_height
    property variant p_width
    property variant p_height
    property color textfile: "red"
    signal returnClicked(variant type);

    function log(message) {
        console.log(message);
    }
   Rectangle {
        anchors.fill: parent
        color:"#f5f5f5"
        Row{
            x:10
            y:5
            spacing:10
            Page{
                id:first
                width:root.width/2
                height:root.height

                header:TabBar {
                    id: tabBar
                    currentIndex: swipeView.currentIndex
                    TabButton {
                        font.pixelSize: 20
                        font.bold: true
                        text: "上 模"
                    }
                    TabButton {
                        font.pixelSize: 20
                        font.bold: true
                        text: "下 模"
                    }
                }
                Rectangle{
                    anchors.fill:parent
                color:"#f5f5f5"
                SwipeView {
                    id: swipeView
                    width: parent.width
                    height: parent.height
                    y:30
                    currentIndex: tabBar.currentIndex

                    Item{
                        width:swipeView.width
                        height: swipeView.height
                        Rectangle {
                            anchors.fill: parent
                            color:"#f5f5f5"
                            Column {
                                spacing: 10
                                width:parent.width-50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Rectangle{
                                    width:swipeView.width
                                    height:350
                                    color:"#f5f5f5"
                                    Image{
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        source: "./png/mouldpic.png"
                                    }
                                    Image{
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        //anchors.fill: parent
                                        anchors.horizontalCenterOffset: 6
                                        y:28
                                        id:topimg
                                        source: "./png/ltopmouldpic.png"

                                    }
                                }
                                NumberAnimation{
                                    running: true
                                    loops:Animation.Infinite
                                    target: topimg
                                    from:-1
                                    to:1
                                    property:"opacity"
                                    duration:1500
                                    //                                    onStopped:{
                                    //                                        log("%1",rtrans.opacity)
                                    //                                        strans.restart()
                                    //                                    }
                                }

                                Row{
                                    spacing:10
                                    Label{
                                        font.pixelSize: 18
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: "上模名称: "
                                        //anchors.bottom: parent.bottom
                                        //anchors.bottomMargin: -125
                                        verticalAlignment :Text.AlignVCenter
                                    }

                                    TextField {
                                        //id: field
                                        width:170
                                        font.pixelSize: 15
                                        horizontalAlignment: "AlignHCenter"
                                        anchors.verticalCenter: parent.verticalCenter
                                        text:"FirstM"
                                        color:textfile
                                        //placeholderText: "TextField"
                                        //anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                }
                                Grid{
                                    columns:2
                                    spacing: 10
                                    rows:2

                                    Row{
                                        spacing:10
                                        Label{
                                            font.pixelSize: 18
                                            width:75
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "角度α:"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            color:textfile
                                            horizontalAlignment: "AlignHCenter"
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "90"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "度"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }
                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "倒角R1: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            horizontalAlignment: "AlignHCenter"
                                            color:textfile
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "0.50"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "mm"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }

                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "高度H1: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            horizontalAlignment: "AlignHCenter"
                                            color:textfile
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "122.00"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "mm"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }

                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "线性力: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            color:textfile
                                            horizontalAlignment: "AlignHCenter"
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "100.00"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "吨/米"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }
                                }
                            }
                        }

                    }
                    Item{
                        width:swipeView.width
                        height: swipeView.height
                        Rectangle {
                            anchors.fill: parent
                            color:"#f5f5f5"
                            Column {
                                spacing: 10
                                width:parent.width-50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Rectangle{
                                    width:swipeView.width
                                    height:350
                                    color:"#f5f5f5"
                                    Image{
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        source: "./png/mouldpic.png"
                                    }
                                    Image{
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.horizontalCenterOffset: 7
                                        y:201
                                        id:bottomimg
                                        source: "./png/lbottommouldpic.png"

                                    }
                                }
                                NumberAnimation{
                                    running: true
                                    loops:Animation.Infinite
                                    target: bottomimg
                                    from:-1
                                    to:1
                                    property:"opacity"
                                    duration:1500
                                    //                                    onStopped:{
                                    //                                        log("%1",rtrans.opacity)
                                    //                                        strans.restart()
                                    //                                    }
                                }

                                Row{
                                    spacing:10
                                    Label{
                                        font.pixelSize: 18
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: "下模名称: "
                                        //anchors.bottom: parent.bottom
                                        //anchors.bottomMargin: -125
                                        verticalAlignment :Text.AlignVCenter
                                    }

                                    TextField {
                                        //id: field
                                        width:170
                                        font.pixelSize: 15
                                        horizontalAlignment: "AlignHCenter"
                                        anchors.verticalCenter: parent.verticalCenter
                                        text:"FirstM"
                                        color:textfile
                                        //placeholderText: "TextField"
                                        //anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                }
                                Grid{
                                    columns:2
                                    spacing: 10
                                    rows:3

                                    Row{
                                        spacing:10
                                        Label{
                                            font.pixelSize: 18
                                            width:75
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "槽宽V:"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            color:textfile
                                            horizontalAlignment: "AlignHCenter"
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "90"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "mm"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }
                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "距离L1: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            horizontalAlignment: "AlignHCenter"
                                            color:textfile
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "0.50"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "mm"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }

                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "角度β: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            horizontalAlignment: "AlignHCenter"
                                            color:textfile
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "122.00"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "度"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }

                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "倒角R1: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            color:textfile
                                            horizontalAlignment: "AlignHCenter"
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "0.5"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "mm"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }
                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "高度H2: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            color:textfile
                                            horizontalAlignment: "AlignHCenter"
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "83.7"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "mm"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }
                                    Row{
                                        spacing:10
                                        Label{
                                            width:75
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "线性力: "
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }

                                        TextField {
                                            //id: field
                                            width:70
                                            font.pixelSize: 15
                                            color:textfile
                                            horizontalAlignment: "AlignHCenter"
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "100.00"
                                            //anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                        Label{
                                            font.pixelSize: 18
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "吨/米"
                                            //anchors.bottom: parent.bottom
                                            //anchors.bottomMargin: -125
                                            verticalAlignment :Text.AlignVCenter
                                        }
                                    }


                                }
                            }
                        }

                    }
                }
                }
            }
            Page{
                //anchors.left: first.right
                width:root.width/2
                height: root.height
                Pane{
                    id:mpane
                    anchors.fill: parent
//                    width: m_page.width/2
//                    height: m_page.height-mToolbar.height


                    Component {
                           id: swipeDelegateComponent

                           SwipeDelegate {
                               id: swipeDelegate
                               //text: labelText
                               contentItem:Item{
                                   id:listviewItem
                                   height:40
                                   width:parent.width
                                   Row{
                                       Text{
                                           width:header1.width-10
                                           height:parent.height
                                           text:"1"
                                           verticalAlignment: Text.AlignVCenter

                                           font.pixelSize: 15
                                       }
                                       Text{
                                           x:header1.width-10
                                           width:header2.width
                                           height:parent.height
                                           text:"Bending Box one"
                                           font.pixelSize: 15
                                       }
                                       Text{
                                           x:header1.width+header2.width-10
                                           width:header3.width
                                           height:parent.height
                                           text:"5"
                                           font.pixelSize: 15
                                       }
                                       Text{
                                           x:header1.width+header2.width+header3.width-10
                                           width:header4.width
                                           height:parent.height
                                           text:"2017/6/26 17:30"
                                           font.pixelSize: 15
                                       }

                                   }
                               }
                               width: parent.width
                               onClicked: if (swipe.complete) view.model.remove(ourIndex)

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

                               swipe.left: removeComponent
                               swipe.right: removeComponent
                           }
                       }

                    ColumnLayout {
                            id: column
                            spacing: 0
                            anchors.fill: parent
                            anchors.topMargin: 0

                            Row{
                //                spacing:2
                                //Layout.fillWidth: true
                                width:mpane.width
                                height:40
                                Button{
                                    id:header1
                                    width:60
                                    height:parent.height
                                    text:"序号"
                                    font.pixelSize: 20
                                    font.bold: true
                                    highlighted: true

                                }
                                Button{
                                    id:header2
                                    width:200
                                    height:parent.height
                                    text:"产品名称"
                                    font.pixelSize: 20
                                    font.bold: true
                                    highlighted: true

                                }
                                Button{
                                    id:header3
                                    width:80
                                    height:parent.height
                                    text:"工步数"
                                    font.pixelSize: 20
                                    font.bold: true
                                    highlighted: true

                                }
                                Button{
                                    id:header4
                                    width:200
                                    height:parent.height
                                    text:"编辑日期"
                                    font.pixelSize: 20
                                    font.bold: true
                                    highlighted: true
                                    //enabled: false
                                    //Layout.fillWidth: true
                                }
                            }

                //            Label {
                //                Layout.fillWidth: true
                //                wrapMode: Label.Wrap
                //                horizontalAlignment: Qt.AlignHCenter
                //                text: "Delegate controls are used as delegates in views such as ListView."
                //            }

                            ListView {
                                id: listView
                                Layout.fillWidth: true
                                Layout.fillHeight: true
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
                        }
                }

            }
        }
    }
}
