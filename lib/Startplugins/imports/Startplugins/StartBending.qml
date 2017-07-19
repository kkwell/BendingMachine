import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0

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

    Label{
        text:"Hello,world!"
        font.pixelSize: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

}
