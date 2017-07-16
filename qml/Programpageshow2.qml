import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
//import QtQuick.Window 2.0
Rectangle{//Flickable {
    id: flickable

    //Material.
    //contentHeight: pane.height
    //readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 2, pane.availableWidth / 3))
    ToolBar {
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
                text:"编程界面展示"
                font.pixelSize: 30
                font.bold: true
                color:"black"
            }

        }

    }

    Row{
        width: parent.width-20
        height:parent.height-mToolbar.height-mbottombar.height-20
        y:mToolbar.height+10
        x: 10
        spacing: 10
        Column {
            id: column
            spacing: 10
            width: parent.width/3*2-5
            height: parent.height

            Rectangle{
                id:ltop
                width:parent.width
                height: parent.height/3-30
                //anchors.fill: parent
                color:"#dedbee"
                Column{
                    x:5
                    y:5
                    //spacing: 5
                    Grid{
                        columns: 4
                        spacing:15
                        Text{
                            width:100
                            text:"产品名称"
                            font.pixelSize: 22
                        }

                        TextInput{
                            width:130
                            //height: 40
                            //y: 7
                            //height:30
                            text:"zynq-1"
                            //color: "lightgreen"
                            font.pixelSize: 22
                            //font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                        Text{
                            text:"步序"
                            font.pixelSize: 22
                        }
                        TextField{
                            width:130
//                            height: 40
                            //y: 7
                            readOnly: true
                            //height:30
                            text:"1/1"
                            color: "black"
                            font.pixelSize: 22
                            //font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                    }
                    Grid{
                        columns: 6
                        spacing:15
                        Image{
                            Layout.alignment: Qt.AlignCenter

                            width:60
                            height:40
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/shangmo.bmp"
                        }
                        TextField{
                            width:100

                            text:"0"
                            color: "lightgreen"
                            font.pixelSize: 22
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                        Image{
                            Layout.alignment: Qt.AlignCenter

                            width:60
                            height:40
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/banhou.bmp"
                        }
                        TextField{
                            width:100
                            text:"0.00"
                            color: "lightgreen"
                            font.pixelSize: 22
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter

                        }
                        Text{
                            text:"材料"
                            font.pixelSize: 22
                        }

                        ComboBox {
                            model: ["铁", "铝", "不锈钢"]

                            width: 100
                            height:36
                        }

                        Image{
                            Layout.alignment: Qt.AlignCenter

                            width:60
                            height:40
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/xiamo.bmp"
                        }
                        TextField{
                            width:100
                            text:"0"
                            color: "lightgreen"
                            font.pixelSize: 22
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                        Image{
                            Layout.alignment: Qt.AlignCenter

                            width:60
                            height:40
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/zwcd.bmp"
                        }
                        TextField{
                            width:100
                            //height: 40
                            //y: 7
                            //height:30
                            text:"0.00"
                            color: "lightgreen"
                            font.pixelSize: 22
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                        Text{
                            text:"抗拉强度"
                            font.pixelSize: 22
                        }

                        TextField{
                            width:100
                            text:"42"
                            color: "lightgreen"
                            font.pixelSize: 22
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                    }
                }
            }
            Rectangle{
                width:parent.width
                height:parent.height-ltop.height-10
                color:"#dedbee"
                Column{
                    y:10
                    width:parent.width
                    height:parent.height
                    spacing: 5
                    Row{
                        x:150
                        spacing:100
                        Text{

                            text:"编程值"
                            font.pixelSize: 22

                        }
                        Text{

                            text:"当前值"
                            font.pixelSize: 22
                        }
                        Text{

                            text:"校正值"
                            font.pixelSize: 22
                        }
                    }
                    Rectangle{
                        x:10
                        width:parent.width-20
                        height:1
                        color:"black"
                    }
                    Row{
                        x:15
                        y:10
                        width:parent.width
                        //height:parent.height
                        spacing: 15
                        Column{
                            x:15
                            spacing: 25
                            Image{
                                Layout.alignment: Qt.AlignCenter

                                width:60
                                height:60
                                fillMode: Image.PreserveAspectFit
                                source:"export/images/jiaodu.bmp"
                            }
                            Text{
                                x:6
//                                width:60
//                                height:60
                                text:"Y1"
                                font.pixelSize: 27
                                font.bold: true
                            }
                            Text{
                                x:6
//                                width:60
//                                height:60
                                text:"Y2"
                                font.pixelSize: 27
                                font.bold: true
                            }
                            Row{
                                spacing: 10
                                Text{
                                    y:5
                                    text:"L"
                                    font.pixelSize: 27
                                    font.bold: true
                                }
                                Text{
                                    text:"外部"
                                    font.pixelSize: 20
                                    color:"blue"
                                }
                            }
                            Row{
                                spacing: 10
                                Text{
                                    y:5
                                    text:"X"
                                    font.pixelSize: 27
                                    font.bold: true
                                }
                                Text{
                                    text:"绝对"
                                    font.pixelSize: 20
                                    color:"blue"
                                }
                            }

                        }
                        Rectangle{
                            width:1
                            height:300
                            color:"black"
                        }

                        Column{
                            y:10
                            spacing:15
                            TextField{
                                width:130
                                text:"0.0"
                                font.pixelSize: 22
                                color: "green"
                                //font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter
                            }
                            TextInput{
                                width:130
                                //height: 40
                                readOnly: true
                                text:"0.00"
                                color: "black"
                                //readOnly: true
                                font.pixelSize: 22
                                //font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter

                            }
                            TextInput{
                                width:130
                                //height: 40
                                readOnly: true
                                //acceptableInput: false
                                //height:30
                                text:"0.00"
                                color: "black"
                                //readOnly: true
                                font.pixelSize: 22
                                //font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter

                            }
                            TextField{
                                width:130
                                //height: 40
                                text:"0.00"
                                color: "green"
                                font.pixelSize: 22
                                font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter

                            }
                            TextField{
                                width:130
                                //height: 40
                                text:"0.00"
                                font.pixelSize: 22
                                color: "green"
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter
                            }
                        }
                        Rectangle{
                            width:1
                            height:300
                            color:"black"
                        }
                        Column{
                            y:65
                            TextInput{
                                width:130
                                //height: 40
                                readOnly: true
                                //acceptableInput: false
                                //height:30
                                text:"245.35"
                                //textColor: "black"
                                //readOnly: true
                                font.pixelSize: 22
                                font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter

                            }
                            TextInput{
                                width:130
                                //height: 40
                                readOnly: true
                                //acceptableInput: false
                                //height:30
                                text:"245.14"
                                //textColor: "black"
                                //readOnly: true
                                font.pixelSize: 22
                                font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter

                            }
                            Rectangle{
                                width:10
                                height:85
                                opacity: 0
                            }

                            TextInput{
                                //y:70
                                width:130
                                //height: 40
                                readOnly: true
                                //acceptableInput: false
                                //height:30
                                text:"69.00"
                                //textColor: "black"
                                //readOnly: true
                                font.pixelSize: 22
                                font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter

                            }
                        }
                        Rectangle{
                            width:1
                            height:300
                            color:"black"
                        }
                        Column{
                            x:30
                            y:10
                            spacing:15
                            TextField{
                                width:130
                                //height: 40
                                //readOnly: true
                                //height:30
                                text:"0.0"
                                color: "green"
                                font.pixelSize: 22
                                //font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter
                            }
                            TextField{
                                width:130
                                //height: 40
                                readOnly: true
                                text:"0.00"
                                //readOnly: true
                                font.pixelSize: 22
                                color: "green"
                                //font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter
                            }
                            TextField{
                                width:130
                                //height: 40
                                readOnly: true

                                text:"0.00"
                                //readOnly: true
                                font.pixelSize: 22
                                color: "green"

                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter
                            }

                            TextField{
                                width:130
                                //height: 40
                                text:"0.00"
                                font.pixelSize: 22
                                color: "green"
                                //font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter

                            }
                        }
                    }
                    Rectangle{
                        width:parent.width-10
                        height:1
                        color:"black"
                    }

                    Row{
                        x:35
                        //spacing:60
                        Text{
                            text:"压力"
                            font.pixelSize: 22
                        }
                        Item{
                            width:42
                            height:1
                        }

                        TextField{
                            width:130
                            //height: 36
                            text:"0.00"
                            font.pixelSize: 22
                            color: "green"
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }

                        Item{
                            width:65
                            height:1
                        }
                        Text{
                            text:"补偿"
                            font.pixelSize: 22
                        }
                        Item{
                            width:77
                            height:1
                        }
                        TextField{
                            anchors.leftMargin: 50
                            width:130
                            //height: 36
                            text:"0.00"
                            font.pixelSize: 22
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                    }
                }
            }
        }

        Column{
            width:parent.width-column.width-10
            height: parent.height
            Rectangle{
                width:parent.width
                height: parent.height
                color:"#dedbee"
                Column{
                    width:parent.width
                    height: parent.height
                    y:10
                    x:10
                    //spacing:10
                    Row{
                        spacing: 10

                        Image{
                            Layout.alignment: Qt.AlignCenter

                            width:96
                            height:60
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/bcTDC.bmp"
                        }

                        TextField{
                            width:130

                            //height:30
                            text:"0.00"
                            font.pixelSize: 22
                            font.bold: true
                            color: "lightgreen"
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                        Text{
                            width:50
                            y: 20
                            text:"mm"
                            font.pixelSize: 22

                        }
                    }
                    Rectangle{
                        width: parent.width-20
                        height:1
                        color:"black"
                    }

                    Row{
                        spacing: 10
                        Image{
                            Layout.alignment: Qt.AlignCenter

                            width:96
                            height:60
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/zhuansudian.bmp"
                        }

                        TextField{
                            width:130

                            text:"0.00"
                            font.pixelSize: 22
                            font.bold: true
                            color: "lightgreen"
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter

                        }
                        Text{
                            width:50
                            y: 20
                            text:"mm"
                            font.pixelSize: 22
                        }
                    }
                    Rectangle{
                        width: parent.width-20
                        height:1
                        color:"black"
                    }
                    Row{
                        spacing: 10
                        Image{
                            Layout.alignment: Qt.AlignCenter

                            width:96
                            height:60
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/jiajindian.bmp"
                        }

                        TextField{
                            width:130
                            text:"0.00"
                            font.pixelSize: 22
                            color: "lightgreen"
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                        }
                        Text{
                            width:50
                            y: 20
                            text:"mm"
                            font.pixelSize: 22
                        }
                    }
                    Rectangle{
                        width: parent.width-20
                        height:1
                        color:"black"
                    }
                    Row{
                        spacing: 10
                        Image{
                            Layout.alignment: Qt.AlignCenter
                            y:20
                            width:96
                            height:100
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/hdltr.bmp"
                            scale: 0.8
                        }
                        Column{
                            Text{
                                x:30
                                text:"同时"
                                font.pixelSize: 22
                                color: "blue"
                            }

                            Row{
                                spacing:20
                                TextField{
                                    width:130

                                    text:"0.00"
                                    font.pixelSize: 22
                                    color: "green"
                                    //font.bold: true
                                    horizontalAlignment: TextInput.AlignHCenter
                                    verticalAlignment: TextInput.AlignVCenter
                               }
                                Text{
                                    width:50
                                    y: 20
                                    text:"mm"
                                    font.pixelSize: 25
                                }
                            }
                        }
                    }
                    Rectangle{
                        width: parent.width-20
                        y:30
                        height:1
                        color:"black"
                    }
                    Row{
                        spacing: 10
                        Text{
                            width:96
                            height:60
                            y:14
                            text:"需求数量"
                            font.pixelSize: 20
                        }

                        TextField{
                            width:130
                            //height: 44
                            y: 7
                            //height:30
                            text:"0.00"
                            font.pixelSize: 22
                            color: "green"
                            //font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            //font.bold: true

                        }
                        Text{
                            width:50
                            y: 10
                            text:"个"
                            font.pixelSize: 22
                        }
                    }
                    Row{
                        spacing: 10
                        Text{
                            width:96
                            height:60
                            y:14
                            text:"完成数量"
                            font.pixelSize: 20
                        }

                        TextField{
                            width:130

                            text:"0.00"
                            font.pixelSize: 22
                            color: "green"
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            //font.bold: true

                        }
                        Text{
                            width:50
                            y: 10
                            text:"个"
                            font.pixelSize: 22
                        }
                    }
                    Rectangle{
                        width: parent.width-20
                        height:1
                        color:"black"
                    }
                    Row{
                        spacing: 20
                        Image{
                            Layout.alignment: Qt.AlignCenter
                            y:17
                            width:60
                            height:100
                            fillMode: Image.PreserveAspectFit
                            source:"export/images/yhzw.bmp"
                        }
                        Column{
                            Column{
                                Row{
                                    spacing:10
                                    Text{
                                        y:12
                                        text:"R"
                                        height:60

                                        font.pixelSize: 25
                                    }
                                    TextField{
                                        width:130
                                        //height: 40
                                        x:10
                                        y: 7
                                        //height:30
                                        text:"0.00"
                                        font.pixelSize: 22
                                        color: "green"
                                        font.bold: true
                                        horizontalAlignment: TextInput.AlignHCenter
                                        verticalAlignment: TextInput.AlignVCenter
                                        //font.bold: true

                                    }
                                    Text{
                                        width:50
                                        y: 20
                                        text:"mm"
                                        font.pixelSize: 22
                                    }
                                }
                            }
                            Column{
                                Row{
                                    spacing: 10
                                    Text{
                                        y:12
                                        text:"X"
                                        height:60
                                        font.pixelSize: 25
                                    }


                                    TextField{
                                        width:130
                                        //height: 40
                                        x:10
                                        y: 7
                                        //height:30
                                        text:"0.00"
                                        font.pixelSize: 22
                                        color: "green"
                                        font.bold: true
                                        horizontalAlignment: TextInput.AlignHCenter
                                        verticalAlignment: TextInput.AlignVCenter
                                    }
                                    Text{
                                        width:50
                                        y: 20
                                        text:"mm"
                                        font.pixelSize: 22
                                    }
                                }
                            }
                        }
                    }

                    Rectangle{
                        width: parent.width-20
                        height:1
                        color:"black"
                    }
                    Row{
                        spacing: 10
                        Text{
                            width:96
                            y:14
                            text:"保压时间"
                            font.pixelSize: 20
                        }

                        TextField{
                            width:130
                            //height: 44
                            y: 7
                            //height:30
                            text:"0.00"
                            font.pixelSize: 22
                            color: "green"
                            font.bold: true
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                      }
                        Text{
                            width:50
                            y: 10
                            text:"个"
                            font.pixelSize: 22
                        }
                    }
                    Rectangle{
                        width: parent.width-20
                        height:20
                        opacity:0
                        //color:"black"
                    }
                }
            }
        }
    }



    ToolBar{
        id:mbottombar
        y:parent.height-parent.height/8
        width: parent.width
        height:parent.height/8
        RowLayout{
            spacing: 5
            anchors.fill: parent
            Repeater {
                model: ListModel {
                    ListElement { title: "新产品";   source: "export/images/P1-PROGmini.png" }
                    ListElement { title: "编辑";   source: "export/images/P1-EDITmini.png" }
                    ListElement { title: "菜单"; source: "export/images/P1-MANUmini.png" }
                    ListElement { title: "上一步";   source: "export/images/tuichumini.png" }
                    ListElement { title: "下一步";   source: "export/images/zhixingmini.png" }
                    ListElement { title: "开始";   source: "export/images/P1-STARTmini.png" }
                    ListElement { title: "DOWN";   source: "export/images/P2-DOWNmini.png" }
                    ListElement { title: "UP";   source: "export/images/P2-UPmini.png" }

                }

                ToolButton{
                    //id:mbbo
                    Layout.preferredHeight: 90
                    //Layout.maximumWidth: 30
                    Layout.preferredWidth:  90
                    onClicked: stackView.replace("qrc:/Programpageshow.qml")
                    Image {
                        id:www
                        anchors.horizontalCenter: parent.horizontalCenter
                        //                        fillMode: Image.Pad
                        //                        horizontalAlignment: mbbo.AlignHCenter
                        //                        verticalAlignment: mbbo.AlignVCenter
                        source: model.source
                    }
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: www.bottom
                        //anchors.topMargin:
                        text:model.title
                    }

                }

           }

        }
    }
}

//ScrollIndicator.vertical: ScrollIndicator { }
//}
