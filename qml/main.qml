import QtQuick 2.7
import QtQuick.Controls 2.0//1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0
import Dataplugins 1.0
import Startplugins 1.0
import Keyboardplugins 1.0

ApplicationWindow {
    id: root
    width: 1024
    height: 768
    visible: true
    color: "#9F9EA3"
    //color:"#f2f1f0"

    property int mtheme:Material.Light
    property int maccent:Material.LightBlue//Material.Grey//Material.Cyan
    property int mprimary:Material.Grey//Material.Cyan
    property variant topDatajson
    property var myTime:new Date
    property int preClick: 0//toolbar上一次点击index

    Material.theme: mtheme
    Material.accent: maccent//Material.Cyan
    Material.primary:mprimary//Material.Cyan

    function log(message) {
        console.log(message);
    }

    Component.onCompleted:{
        //myTime = new Date;
        //animationForOpacity.start();
        //stackView.push(data_page)
    }
//    Serial{
//        id:pSerial
//    }

    Timer {
        interval: 500; running: true; repeat: true;
        onTriggered: {
            var date = new Date;
            if(date!==myTime){
                myTime = date
                textTime.text = Qt.formatTime(myTime,"hh:mm:ss")
                //"yyyy-MM-dd"
            }
        }
    }
    Data{
        id:topDatajson
        type:0//type
        Component.onCompleted:{
            //data_page_sql.mDatajson=mDatajson
        }
    }
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
        height: 50
        radius: 8
        z:1
        anchors.leftMargin: 8
        anchors.topMargin:8
        anchors.bottomMargin: 8
        gradient: Gradient{
            GradientStop{position: 0.0;color: "#FCFCFC"}
            GradientStop{position: 1.0;color: "#D4D4D4"}
        }

        Image {
            id: mylogo
            source: "logo.png"
            width:120
            height:40
            x:10
            y:5
            z:1
        }
    }
    Rectangle{
        id:status
        anchors.right: parent.right
        anchors.top:parent.top
        anchors.left: logo.right
        height: 50
        radius: 8
        z:1
        anchors.leftMargin: 6
        anchors.rightMargin: 8
        anchors.topMargin:8
        anchors.bottomMargin: 8
        gradient: Gradient{
            GradientStop{position: 0.0;color: "#FCFCFC"}
            GradientStop{position: 1.0;color: "#D4D4D4"}
        }
        Row{
            Column{
                Text{
                    id:textState
                    width:status.width/2
                    height: status.height
                    text:"程序库"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 25
                    font.bold: true
                    font.family: "仿宋"
                    color: "#565E83"
                }
            }
            Text{
                id:textTime
                width:status.width/2-10
                height: status.height
                //text:
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 30
                font.bold: true
                font.family: "仿宋"
                color: "#565E83"
            }
        }

    }

    Rectangle{
        id:databack
        anchors{
            top:logo.bottom
            left:parent.left
            right:parent.right
            bottom:toolbar.top
        }
        anchors.leftMargin:8
        anchors.rightMargin: 8
        anchors.topMargin:8
        radius: 8
        //color:"transparent"
        //z:1
        gradient: Gradient{
            GradientStop{position: 0.0;color: "#c4c7cc"}
            GradientStop{position: 1.0;color: "#c4c7cc"}
        }

        DatasqlMain {
            id:datasql_page
            p_width:parent.width
            p_height:parent.height
            mDatajson:topDatajson
            selectindex:topDatajson.selectindex
            swipeindex:0//topswipeindex

            onReturnSwipeviewChanged:{
                //index:datelist datestep
                //log(preClick+"-"+index)
                mrep.itemAt(preClick).state=''
                mrep.itemAt(index).state='clicked'
                preClick = index
            }
        }
    }

    Rectangle {
        id:toolbar
        y: parent.height-height
        width: parent.width
        height: parent.height/8
        color: "#9F9EA3"
        RowLayout{
            spacing:6
            anchors.fill: parent
            anchors.leftMargin: 13

            Repeater {
                id:mrep
                model: ListModel {
                    id: listModel
                    ListElement { title: "产品库";   source: "Product_documentation.png";state:''}
                    ListElement { title: "工序";   source: "build.png" ;state:''}
                    ListElement { title: "全自动"; source: "P1-STARTmini.png" ;state:''}
                    ListElement { title: "半自动";   source: "P1-MANUmini.png" ;state:''}
                    ListElement { title: "手动";   source: "hand_pointer.png" ;state:''}
                    ListElement { title: "模具";   source: "mould_tool.png" ;state:''}
                    ListElement { title: "参数设置";   source: "set_system.png" ;state:''}
                    ListElement { title: "权限";   source: "add_user_group.png" ;state:''}
                    ListElement { title: "帮助";   source: "P1-HELPmini.png" ;state:''}
                }
                Component.onCompleted:{
                    mrep.itemAt(0).state='clicked'
                }
                Rectangle{
                    id:titleRect
                    implicitWidth: 85
                    implicitHeight: 75
                    border.width: sdf.pressed?2:1
                    border.color: "#888"
                    radius: 4
                    //color: titleRect.state==='clicked'?"#e7e7e7" :"#e7e7e7"

                    gradient: Gradient {
                        GradientStop { position: 0 ; color: sdf.pressed||state==='clicked' ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: sdf.pressed||state==='clicked' ? "#aaa" : "#ccc" }
                    }
                    Image{
                        id:topImg
                        width:50
                        height:50
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:5
                        source: model.source
                    }
                    Text{
                        id:listtitle
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top:topImg.bottom
                        //anchors.topMargin: 2
                        text:model.title
                        font.pixelSize: 13
                        font.family: "Ubuntu"
                        font.bold: true
                        color: 'black'
                    }

                    MouseArea{
                        id:sdf
                        anchors.fill: parent
                        //onPressed: state='clicked'
                        onClicked: {
                            if(mrep.itemAt(index).state!=='clicked'){
                                mrep.itemAt(index).state='clicked'
                                //log(index)
                                mrep.itemAt(preClick).state=''

                                preClick = index
                                datasql_page.swipeindex=index
                                switch(index){
                                case 0:mylogo.opacity=1
                                    topDatajson.type=0;
                                    return
                                case 1:mylogo.opacity=1
                                    topDatajson.type=1;
                                    return
                                case 2:mylogo.opacity=0
                                    return //stackView.push(start_page)//stackView.replace(start_page)
                                case 3:mylogo.opacity=0
                                    return
                                case 4:mylogo.opacity=0
                                    return
                                case 5:mylogo.opacity=0
                                    return
                                    //return stackView.replace(mould_page)

                                default:materialUI.showSnackbarMessage( "此功能暂未开放" );
                                }
                            }


                        }
                        //onContainsMouseChanged:
                    }
                }
            }
        }
    }
    MouseArea{
        enabled: keyboard.visible
        anchors{
            top:parent.top
            left:parent.left
            right:parent.right
        }
        height:400
        onClicked: keyboard.visible=false
    }

    Rectangle{
        id: keyboard
        visible: false
        width: root.width
        height: 270
        z:1
        //radius: 8
        anchors {
            horizontalCenter: parent.horizontalCenter;
            bottom: parent.bottom;
        }

        color: "transparent"//"lightskyblue"//"#00000000"

        Keyboard{
            id: key
            //anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: parent.bottom
            //anchors.bottomMargin: 5
            anchors.left: parent.left
            //anchors.leftMargin: 5
            mDatajson:topDatajson

            onReturnClicked:{
                log(type)
                if(type==1){//恢复编辑值
                    //topDatajson.editvalue = topDatajson.myvalue
                    datasql_page.setvalue()
                    //log(topDatajson.editvalue)
                }//回车设置编辑值
                else if(type==2){
                    topDatajson.setData(topDatajson.index(1,0),"fe",0)
                }
            }
            onSetvalueClicked:{
                log(value)
                //topDatajson.editvalue = value
            }
            MyKeyboard{
                id:myKeyboard
            }
            Connections{
                target: myKeyboard
                onCloseKeyboard: {
                    //keyboardshadow.visible = false
                    keyboard.visible = false
                }
            }
        }
    }
    DropShadow {
        anchors.fill: keyboard
        visible: keyboard.visible
        horizontalOffset: 0
        verticalOffset: -1
        z:0
        radius: 8
        samples: 17
        color: "black"
        spread: 0.0
        source: keyboard
    }
    onActiveFocusItemChanged: {
        //console.log("isInputType = " + myKeyboard.isInputType());
        if(myKeyboard.isInputType())
        {
            keyboard.visible = true;
            //keyboardshadow.visible = true
            /*if(keyboard.x == -1200)
            {
                keyboard.x = keyboard.x + 1200;
                //keyboard.y = keyboard.y + 50;
            }
            */
        }
        else
        {
            /*if(keyboard.x == 0)
            {
                keyboard.x = keyboard.x - 1200;
                //keyboard.y = keyboard.y - 50;
            }
            */
            keyboard.visible = false;
            //keyboardshadow.visible = false
        }
    }
    MaterialUI {
        id: materialUI
        z: 2
        //anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -170
        dialogCancelText: "取消"
        dialogOKText: "确定"
    }

}
