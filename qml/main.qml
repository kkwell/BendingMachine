import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0
import Dataplugins 1.0
import Startplugins 1.0

ApplicationWindow {
    id: root
    width: 1024
    height: 768
    visible: true
    color: "#fafafa"
    //color:"#f2f1f0"

    property int mtheme:Material.Light
    property int maccent:Material.LightBlue//Material.Grey//Material.Cyan
    property int mprimary:Material.Grey//Material.Cyan
    property string xxx

    Material.theme: mtheme
    Material.accent: maccent//Material.Cyan
    Material.primary:mprimary//Material.Cyan
    Image {
        id: xx
        source: "logo.png"
        width:313
        height:50
        x:700
        y:7
        z:1
    }

    function log(message) {
        console.log(message);
    }

    Component.onCompleted:{
        //animationForOpacity.start();

    }

    StackView {
        id: stackView
        width:parent.width
        height:parent.height-toolbar.height
        initialItem: data_page//data_page//"qrc:/menulist.qml"
    }
//    Data {
//        id: data
//    }
    Component{
        id:data_page
        Datasql {
            id:data_page_sql
            p_width:stackView.width
            p_height:stackView.height
            //ggp:data.idData
//            Data {
//                id: data
//            }
            //xdf.text: data.idData
            //ggp:data.idData

        }
    }
    Component{
        id:datastep_page
        Datasqlstep{
            p_width:stackView.width
            p_height:stackView.height
//            Data{

//            }
        }
    }
    Component{
        id:start_page
        StartBend { // this class is defined in QML

            Start { // this class is defined in C++ (plugin.cpp)
                id: start
            }

            p_width:stackView.width
            p_height:stackView.height

        }
    }

    //    MaterialButton {
    //        width: parent.width
    //        height: 42
    //        elevation: 0
    //        textHorizontalAlignment: Text.AlignLeft
    //        backgroundColor: "#2196f3"
    //        onClicked: {
    //            materialUI.showSnackbarMessage( "此功能暂未开放" );
    //        }

    //        MaterialLabel {
    //            x: 18
    //            height: parent.height
    //            text: "请重新选择"
    //            font.bold: true
    //            verticalAlignment: Text.AlignVCenter
    //            font.pixelSize: 16
    //            color: "#1e88e5"

    //            Behavior on color { ColorAnimation { duration: 200 } }
    //        }

    //    }

    ToolBar {
        id:toolbar
        y: parent.height-height
        width: parent.width
        height: parent.height/8

        RowLayout{
            spacing:6
            anchors.fill: parent
            anchors.leftMargin: 13

            //            ExclusiveGroup {
            //                    id: language;
            //                }
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
                                log(index)
                                for(var i=0; i<9; ++i){
                                    if(i!==index){
                                        mrep.itemAt(i).state=''
                                    }
                                }
                                switch(index){
                                case 0:return stackView.replace(data_page)
                                case 1:return stackView.replace(datastep_page)
                                case 2:return stackView.replace(start_page)

                                default:materialUI.showSnackbarMessage( "此功能暂未开放" );
                                }
                            }


                        }
                        //onContainsMouseChanged:
                    }
                    //                    states: [
                    //                          State {
                    //                              name: "clicked"
                    //                              PropertyChanges { target: titleRect; color: "#ccc" }
                    //                          }

                    //                      ]

                    //                    onClicked:{
                    //                        switch(index){
                    //                        case 0://titleRect.enabled=false
                    //                            //titleRect.style =
                    //                        case 1:ourIndex = index;return stackView.replace(data_page)
                    //                        }

                    //                    }


                    //                    style: ButtonStyle{
                    //                        background: Rectangle {
                    //                            implicitWidth: 85
                    //                            implicitHeight: 75
                    //                            border.width: control.activeFocus ? 2 : 1
                    //                            border.color: "#888"
                    //                            radius: 4

                    //                            gradient: Gradient {
                    //                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    //                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    //                            }
                    //                        }
                    //                    }
                }
            }
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
