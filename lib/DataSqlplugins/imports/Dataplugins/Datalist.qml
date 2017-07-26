import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import Dataplugins 1.0

Rectangle{
    id:mpane
    anchors.fill: parent
    color: "#f2f1f0"
    property int mwidth:920
    function setlrepeatermodel(jsonData)
    {
        lrepeatermodel.setProperty(0, "test", jsonData.name)
        lrepeatermodel.setProperty(1, "test", jsonData.topmould)
        lrepeatermodel.setProperty(2, "test", jsonData.widthness)
        lrepeatermodel.setProperty(3, "test", jsonData.bottommould)
        lrepeatermodel.setProperty(4, "test", jsonData.thickness)
        lrepeatermodel.setProperty(5, "test", jsonData.shangsidian)
        lrepeatermodel.setProperty(6, "test", jsonData.material)
        lrepeatermodel.setProperty(7, "test", jsonData.zhuansudian)
        lrepeatermodel.setProperty(8, "test", jsonData.jiajindian)
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
            dataLoader.source = "ListViewLoader.qml"
        }
    }

    Component.onCompleted:{
        //listView.update()
    }
    Item{
        width: 920
        height: parent.height
        anchors.top: topRow.bottom
        Loader{id:dataLoader}
   }
}

