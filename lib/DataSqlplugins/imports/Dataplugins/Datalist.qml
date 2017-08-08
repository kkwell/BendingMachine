import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0
//import QtQuick.Dialogs 1.2
import Dataplugins 1.0
Rectangle{
    id:mpane
    anchors.fill: parent
    color: "#f2f1f0"
    //Material.foreground: //Material.blue
    //Material.background: "lightblue"//Material.green
    property int mwidth:920
    property int selectx:0//当前选中行索引
    function test(){
        mDatajson.id_changedown(2);
    }

    function pageup(){
        selectx = 0;
        mDatajson.pageup();
    }
    function datanew(){
        newDataDialog.open();
    }

    function sqldelete(){
        var sid = (mDatajson.pagenum-1)*8+selectx;//选中数据id
        if(mDatajson.pagenum==Math.ceil(mDatajson.databasenum/8)){//如果是最后一页
            if(mDatajson.databasenum%8<=selectx+1){//如果当前selectx超出最后一页数据个数
                if(selectx==0){
                    //selectx = 7;
                    mDatajson.pageup();
                    selectx = 7;
                }
                else{
                    selectx = selectx - 1;
                }
            }
        }
        mDatajson.deletesql(sid);
    }

    function copy(){
        mDatajson.minsert((mDatajson.pagenum-1)*8+selectx);
        if(selectx==7){
            pagedown();
        }
        else{
            selectx = selectx+1;
        }
    }

    function pagedown(){
        selectx = 0;
        mDatajson.pagedown();
    }
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
            }
        }
    }

    Data{
        type:0
        id:mDatajson
        Component.onCompleted:{
            //dataLoader.source = "ListViewLoader.qml"
            dataLoader.sourceComponent=loaderRect
        }
    }

    Item{
        width: 920
        height: parent.height
        anchors.top: topRow.bottom
        Loader{
            id:dataLoader
            //anchors.fill: parent

            //sourceComponent: loaderRect
        }
      }
    Component{
        id:loaderRect
        ListViewLoader{
            id:mlistViewLoader
        }
    }
    Popup {
        id: newDataDialog
        x: (parent.width - width) / 2+50
        y: parent.height / 5+50
        width: 300//Math.min(parent.width, parent.height) / 3 * 2
        height: 200//settingsColumn.implicitHeight + topPadding + bottomPadding
        //modal: true
        //Material.foreground: "lightblue"//Material.blue
        Material.background: "lightskyblue"//Material.green
        focus: true
        contentItem: Rectangle {
            id: settingsColumn
            //color:"lightskyblue"

            Label {
                height: 50
                id:topstyle
                text: "请选择编程方式:"
                font.bold: true
                font.pixelSize: 20
            }

            Row {
                anchors.top: topstyle.bottom
                spacing: 20
                x:9

                Button {
                    id: okButton
                    width:120
                    height:100
                    text: "数据编程"
                    font.pixelSize: 20
                    onClicked: {
                        //settings.style = styleBox.displayText
                        newDataDialog.close()
                    }
                    Material.foreground: Material.blue
                    Material.background: Material.green

//                    Material.elevation: 0

//                    Layout.preferredWidth: 0
//                    Layout.fillWidth: true
                }

                Button {
                    id: cancelButton
                    width:120
                    height:100
                    text: "图形编程"
                    font.pixelSize: 20
                    onClicked: {
                        //styleBox.currentIndex = styleBox.styleIndex
                        newDataDialog.close()
                    }

//                    Material.background: "transparent"
//                    Material.elevation: 0

//                    Layout.preferredWidth: 0
//                    Layout.fillWidth: true
                }
            }
        }
    }


}

