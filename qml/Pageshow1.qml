import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Page{//Flickable {
    id: flickable
    //contentHeight: pane.height

    readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 2, pane.availableWidth / 3))
    header: ToolBar {
        id:mToolbar
        //Material.foreground: "white"
        width: parent.width
        height:parent.height/10-20
        RowLayout {
            spacing: 10
            anchors.fill: parent
            ToolButton {
                id:mbutton
                Layout.preferredHeight: 60
                //Layout.maximumWidth: 30
                Layout.preferredWidth:  60
                //Layout.maximumHeight: 30
                Image {
                    id:homeico
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "export/images/phome.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        homeico.source="export/images/home.png"
                        mbutton.scale = 0.9
                        //homeico.scale = 0.9
                    }
                    onReleased: {
                        homeico.source="export/images/phome.png"
                        //homeico.scale = 1
                        mbutton.scale = 1
                    }
                    onClicked: {stackView.replace(main_page)}
                }
            }
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text:"控件效果展示"
                font.pixelSize: 30
                font.bold: true
                color:"black"
            }
        }
        //        TextField {
        //            id: searchBox

        //            placeholderText: "Search..."
        //            inputMethodHints: Qt.ImhNoPredictiveText

        //            width: parent.width / 6
        //            anchors.right: parent.right
        //            anchors.verticalCenter: parent.verticalCenter
        //        }
    }
    Pane {
        id: pane
        width: parent.width

        Column {
            id: column
            spacing: 40
            width: parent.width

            Label {
                width: parent.width
                wrapMode: Label.Wrap
                horizontalAlignment: Qt.AlignHCenter
                text: "Button presents a push-button that can be pushed or clicked by the user. "
                    + "Buttons are normally used to perform an action, or to answer a question."
            }
        Row{
            anchors.fill: parent
            anchors.topMargin: 50
            spacing: 50
            GroupBox {
                title: "ComboBox"
            Column {
                spacing: 20
                //anchors.horizontalCenter: parent.horizontalCenter

                    Button {
                        text: "First"
                        width: 100
                        ToolTip.timeout: 5000
                        ToolTip.visible: pressed
                        ToolTip.text: "This is a tool tip."
                        //onClicked: optionsMenu.open()
                    }
                    Button {
                        id: button
                        text: "Second"
                        width: 80
                        highlighted: true
                        ToolTip.timeout: 5000
                        ToolTip.visible: pressed
                        ToolTip.text: "This is a tool tip."
                    }
                    Button {
                        text: "Third"
                        enabled: false
                        width: 90
                    }


                    ComboBox {
                        model: ["First", "Second", "Third", "模具1","上模具","下模具"]
                        width: Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                        //anchors.horizontalCenter: parent.horizontalCenter
                    }

                    ComboBox {
                        model: ["模具1","上模具","下模具","数据库","材料"]
                        width: Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                        //anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Button {
                        text: "Message"
                        //anchors.horizontalCenter: parent.horizontalCenter
                        width: buttonWidth
                        //onClicked: messageDialog.open()

//                        Dialog {
//                            id: messageDialog

//                            x: (parent.width - width) / 2
//                            y: (parent.height - height) / 2

//                            title: "Message"

//                            Label {
//                                text: "Lorem ipsum dolor sit amet..."
//                            }
//                        }
                    }

            }
            }

            Column {
                spacing: 20
                //anchors.horizontalCenter: parent.horizontalCenter

                RadioButton {
                    text: "First"
                }
                RadioButton {
                    text: "Second"
                    checked: true
                }
                RadioButton {
                    text: "Third"
                    enabled: false
                }
                Tumbler {
                    model: 10
                    visibleItemCount: 5
                    //anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                spacing: 30
            ProgressBar {
                id: bar
                value: 0.5
                width: 200
                indeterminate: true
                //anchors.horizontalCenter: parent.horizontalCenter
            }
            SpinBox {
                id: box
                value: 50
                width: 200
                //anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: field
                placeholderText: "TextField"
                width: Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                //anchors.horizontalCenter: parent.horizontalCenter
            }
            TextField {
                id: field2
                placeholderText: "请输入角度"
                width: Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                //anchors.horizontalCenter: parent.horizontalCenter
            }
            Dial {
                value: 0.5
                //anchors.horizontalCenter: parent.horizontalCenter
            }
            Dial {
                value: 1
                //anchors.horizontalCenter: parent.horizontalCenter
            }
            }
            GroupBox {
                title: "Switch"
            Column {
                spacing: 20
                //anchors.horizontalCenter: parent.horizontalCenter

                Switch {
                    text: "First"
                }
                Switch {
                    text: "Second"
                    checked: true
                }
                Switch {
                    text: "Third"
                    enabled: false
                }
                CheckBox {
                    text: "First"
                    checked: true
                }
                CheckBox {
                    text: "Second"
                }
                CheckBox {
                    text: "Third"
                    checked: true
                    enabled: false
                }


            }
            }


        }
        }
    }

    //ScrollIndicator.vertical: ScrollIndicator { }
}
