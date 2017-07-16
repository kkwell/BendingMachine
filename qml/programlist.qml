//import QtQuick 2.6
//import QtQuick.Controls 2.0
//import QtQuick.Controls.Material 2.0
//import QtQuick.Layouts 1.3
import Programpages 1.0

    Programpage { // this class is defined in C++ (plugin.cpp)
        id:mpage
        Xpage{
            id:test
        }
        p_width:parent.width
        p_height:parent.height
        onReturnClicked:{
            stackView.replace("menulist.qml")
        }

    }


