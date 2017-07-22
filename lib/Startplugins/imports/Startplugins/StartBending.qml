import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0
import Startplugins 1.0
Rectangle {
    id: root
    width: p_width; height: p_height;
    property variant p_width
    property variant p_height
    //signal

    //function

    function log(message) {
        console.log(message);
    }

//    Label{
//        id:xxy
//        text:"Hello,world!"
//        font.pixelSize: 25
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter
//    }
//    Start{
//        id:mdata
//    }
    ListView {
            //anchors.fill: parent

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
            model: Start{}
            delegate: itemDelegate
        }

        Component {
            id: itemDelegate
            Item {

                // 本方法不适合在 QAbstractItemModel* 及其子类中使用，除非 QAbstractItemModel* 及其子类有设定 modelData 这个角色
//                property var item: try {
//                                       // modelData 适用与 list<QtObject> 类型， js 数组类型，数字等
//                                       // 注意 QtObject* 除 QAbstractItemModel* 外都会转换成 list<QtObject> 这种类型

//                                       console.debug("typeof modelData", typeof modelData)
//                                       return modelData;
//                                   } catch(e) {
//                                       return ListView.view.model.get(index);
//                                   }

//                property string name    : item && item.name
//                property string age     : item && item.age
                Text {
                    anchors.centerIn: parent
                    text: name + "-"+age
                }
            }
        }


}
