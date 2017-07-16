//import QtQuick 2.7
//import QtQuick.Controls 2.0
//import QtQuick.Layouts 1.0
//import QtQuick.Controls.Material 2.0
//import QtQuick.Window 2.0
import Pages 1.0

//Rectangle  {
//    id: menulistpane
//    width:parent.width
//    height:parent.height
//    //color: "#2196F3"

    Mainpage {
        id:mpage
        p_width:parent.width
        p_height:parent.height
        function pageName(index){
            switch (index) {
            case 0: return "qrc:/programlist.qml"
            case 1: return "qrc:/mjcharge.qml"
            case 2: return "qrc:/Myindecator.qml"
            case 3: return "OPER.MINUS"
            }
        }
        Xpage{
            id:test
        }
        onIconClicked:{
            log(pageName(x))
            //emit:mainiconClicked(pageName(x))
            stackView.replace(pageName(x))
        }
    }
//}

