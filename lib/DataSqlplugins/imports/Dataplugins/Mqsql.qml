import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

//import QtQuick.Window 2.1
import QtQuick.Controls 1.4
Rectangle{
    id:mpane
    width: root.width-120
    height: 400
    x:20
    color:"#f2f1f0"
    ColumnLayout {
        id: column
        spacing: 10
        anchors.fill: parent
        ListModel
        {
            id: tableModel

            ListElement
            {
                checked: false
                color: "blue"
            }

            ListElement
            {
                checked: true
                color: "green"
            }

            ListElement
            {
                checked: false
                color: "red"
            }
        }

        TableView {
            id: dataList
            anchors.fill: parent
            model: tableModel

            contentHeader:Item {
                width: dataList.width
                height:30
                Row{
                    x:-1
                    spacing:-1
                    Repeater {
                        model: ListModel {
                            ListElement { name: "序号";     len:70  }
                            ListElement { name: "名称";     len:200  }
                            ListElement { name: "步数";     len:40  }
                            ListElement { name: "板宽";     len:75  }
                            ListElement { name: "板厚";     len:75  }
                            ListElement { name: "材料";     len:75  }
                            ListElement { name: "上模";     len:75  }
                            ListElement { name: "下模";       len:75  }
                            ListElement { name: "已加工数";    len:70  }
                            ListElement { name: "编辑时间";    len:158  }
                            //ListElement { title: "下一页";   source: "P1-PROGmini.png" }
                        }
                    Button {
                        width:model.len
                        height: 25
                        Text{
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            text:model.name
                            font.pixelSize: 16
                            color: 'black'
                        }
                    }
                    }
                }
            }

            itemDelegate: Item{

                Item {
                    height: 30
                    //opacity: 0
                    Rectangle{
                        id:mrct
                        width: 10
                        height: 10
                        x:10
                        y:10
                        color:"blue"
                    }
                    Text {
                        id: listnum
                        text: qsTr("12")
                        font.pixelSize: 30
                    }
                }

                CheckBox
                {
                    anchors.centerIn: parent
                    checked: styleData.value
                    visible: isCheckColumn( styleData.column )
                }

                Text
                {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: styleData.value
                    color: isCheckColumn( styleData.column )? "black": styleData.value
                    visible: !isCheckColumn( styleData.column )
                }

                function isCheckColumn( columnIndex )
                {
                    return dataList.getColumn( columnIndex ) === checkedColumn
                }
            }
            //! [2]
            //model:
            //! [2]


            TableViewColumn {
                id:checkedColumn
                role: "id"
                title: qsTr("ID")
                width: dataList.width * 0.7

            }
            TableViewColumn {
                role: "start"
                title: qsTr("Running")
                width: dataList.width * 0.3 - 5
            }

            onClicked: {
                //                explorer.selectedSensorItem = explorer.availableSensors[row]
                //                //! [3]
                //                propertyList.model = explorer.selectedSensorItem.properties
                //                //! [3]
                //                button.update()
            }
        }

    }
}
