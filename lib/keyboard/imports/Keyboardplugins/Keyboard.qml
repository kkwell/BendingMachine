import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQml 2.2

Rectangle{
    id:root
    anchors.fill: parent
    //anchors.verticalCenter: parent.verticalCenter
    focus:false
    color:backcolor
    property variant mDatajson

    property string backcolor: "black"//"lightskyblue"

    signal returnClicked(variant type);
    signal setvalueClicked(variant value);

    MouseArea{
        anchors.fill: parent
    }

    QtObject {
        id:pimpl
        property bool shiftModifier: false
        property bool symbolModifier: false
        property int verticalSpacing: (keyboard.height-editHight) / 40
        property int horizontalSpacing: verticalSpacing
        property int rowHeight: (keyboard.height-editHight)/4 - verticalSpacing*1.3
        property int buttonWidth:  (column.width-column.anchors.margins)/10 - horizontalSpacing-2
        property int editHight: 50
    }

    //Load styles
    MyStyles {
        id: myStyles
    }

    KeyModel {
        id:keyModel
    }

    Component {
        id: keyButtonDelegate
        KeyButton {
            id: button
            //style: myStyles.toolButtonStyle
            width: pimpl.buttonWidth
            height: pimpl.rowHeight
            text: (pimpl.shiftModifier) ? letter.toUpperCase() : letter
            inputPanel: root
        }
    }
    Component {
        id: keyNumDelegate
        KeyButton {
            id: button
            color: letter=='.'||letter=='-'? "#1e1b18":"#35322f"
            width: pimpl.buttonWidth
            height: pimpl.rowHeight
            text: letter
            inputPanel: root
        }
    }

    function showKeyPopup(keyButton){
        console.log("showKeyPopup");
        keyPopup.popup(keyButton, root);
    }

    KeyPopup {
        id: keyPopup
        visible: false
        z: 100
    }

    Row{
        id:topRow
        //anchors.fill: parent
        width:parent.width
        height:parent.height-pimpl.editHight
        anchors.bottom: parent.bottom
        spacing:5
        Rectangle {//char key
            id:lkeyboard
            color: backcolor
            width: parent.width/3*2-10
            height: parent.height-pimpl.editHight

            Column {
                id:column
                anchors.margins: 5
                anchors.fill: parent
                spacing: pimpl.verticalSpacing

                Row {//first row
                    height: pimpl.rowHeight
                    spacing: pimpl.horizontalSpacing
                    anchors.horizontalCenter:parent.horizontalCenter
                    Repeater {
                        model: keyModel.firstRowModel
                        delegate: keyButtonDelegate
                    }
                }
                Row {//second row
                    height: pimpl.rowHeight
                    spacing: pimpl.horizontalSpacing
                    anchors.horizontalCenter:parent.horizontalCenter
                    Repeater {
                        model: keyModel.secondRowModel
                        delegate: keyButtonDelegate
                    }
                }
                Item {//third row
                    height: pimpl.rowHeight
                    width:parent.width
                    x:pimpl.horizontalSpacing
                    KeyButton {
                        id: shiftKey
                        color: (pimpl.shiftModifier)? "#1e6fa7": "#1e1b18"
                        anchors.left: parent.left
                        width: 1.6*pimpl.buttonWidth
                        height: pimpl.rowHeight
                        font.family: "FontAwesome"
                        text: "Shift"
                        functionKey: true
                        onClicked: {
                            if (pimpl.symbolModifier) {
                                pimpl.symbolModifier = false
                            }
                            pimpl.shiftModifier = !pimpl.shiftModifier
                        }
                        inputPanel: root
                        showPreview: false
                    }
                    Row {
                        id:xrow
                        height: pimpl.rowHeight
                        spacing: pimpl.horizontalSpacing
                        anchors.left: shiftKey.right
                        anchors.leftMargin: spacing
                        //anchors.horizontalCenter:parent.horizontalCenter
                        Repeater {
                            //anchors.horizontalCenter: parent.horizontalCenter
                            model: keyModel.thirdRowModel
                            delegate: keyButtonDelegate
                        }
                    }
                    KeyButton {
                        id: pointKey
                        font.family: "FontAwesome"
                        color: "#1e1b18"
                        anchors.left: xrow.right
                        anchors.leftMargin: pimpl.horizontalSpacing
                        width: 1.25*pimpl.buttonWidth
                        height: pimpl.rowHeight
                        text: "."
                        //displayText: "\uf177"
                        inputPanel: root
                    }
                }
                Row {//last row
                    height: pimpl.rowHeight
                    spacing: pimpl.horizontalSpacing
                    anchors.horizontalCenter:parent.horizontalCenter
//                    KeyButton {
//                        id: hideKey
//                        color: "#1e1b18"
//                        width: 1.25*pimpl.buttonWidth
//                        height: pimpl.rowHeight
//                        font.family: "FontAwesome"
//                        text: "\uf078"
//                        functionKey: true
//                        onClicked: {
//                            Qt.inputMethod.hide()
//                        }
//                        inputPanel: root
//                        showPreview: false
//                    }
                    KeyButton {
                        id: spaceKey
                        width: 6*pimpl.buttonWidth
                        height: pimpl.rowHeight
                        text: " "
                        inputPanel: root
                        showPreview: false
                    }

                    KeyButton {
                        id: enterKey
                        color: "#1e1b18"
                        width: 2.5*pimpl.buttonWidth
                        height: pimpl.rowHeight
                        displayText: "Enter"
                        text: "\n"
                        inputPanel: root
                        showPreview: false
                        onClicked: {
                            emit:returnClicked(2)
                        }
                    }
                }
            }
        }
        Rectangle {//num key
            id:rkeyboard
            width:pimpl.buttonWidth*4+pimpl.horizontalSpacing*5//parent.width/3
            height: parent.height-pimpl.editHight
            color: backcolor
            Row{
                id:numRow
                anchors.fill: parent
                anchors.margins: 5
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                Grid{
                    rows: 4
                    columns: 3
                    spacing:pimpl.horizontalSpacing
                    Repeater {
                        model: keyModel.numModel
                        delegate: keyNumDelegate
                    }
                }
                Column{
                    spacing: pimpl.horizontalSpacing
                KeyButton {
                    id: deleteKey
                    color: "#1e1b18"
                    width: pimpl.buttonWidth
                    height: 2*pimpl.rowHeight+pimpl.horizontalSpacing
                    text: "←"
                    inputPanel: root
                    showPreview: false
                }
                KeyButton {
                    id: enternumKey
                    color: "#1e1b18"
                    width: pimpl.buttonWidth
                    height: 2*pimpl.rowHeight+pimpl.horizontalSpacing
                    displayText: "Enter"
                    text: "\n"
                    inputPanel: root
                    showPreview: false
                }
                }


            }
        }
        Rectangle{
            width: 80
            height: 1.2*pimpl.rowHeight+pimpl.horizontalSpacing
            color: backcolor
            KeyButton{
                anchors.fill: parent
                color:"green"
                anchors.margins: 5
                anchors.leftMargin: 8
                anchors.horizontalCenter:parent.horizontalCenter
                text:"↓"
                onClicked: myKeyboard.simulateKeyPressEvent("关闭", "");
            }
        }
    }

    Rectangle {
        id: editRec
        width: parent.width-anchors.leftMargin-92
        height: pimpl.editHight-5
        anchors.left: parent.left
        anchors.leftMargin: 22
        color: "#35322f"//"lightgreen"//backcolor
        anchors.bottom: topRow.top
        Row{
            anchors.fill: parent
            spacing: 10
            Text{
                id: txt1
                color: "white"
                width:(parent.width-parent.height-50)/3
                height:editRec.height-10
                anchors.verticalCenter: parent.verticalCenter
                fontSizeMode: Text.Fit
                font.pixelSize: height
                horizontalAlignment: Text.AlignRight//AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: mDatajson.editname + " : "
            }

            TextField{
                id:inputField
                width: (parent.width-parent.height-50)/3
                height: editRec.height-10
                font.pixelSize: height-6
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: mDatajson.editvalue
                MouseArea{
                    anchors.fill: inputField
                    onClicked: {
                    }
                }
            }
            Text{
                id: txt2
                color: "white"
                width:(parent.width-parent.height-50)/9*2
                height:editRec.height-10
                anchors.verticalCenter: parent.verticalCenter
                fontSizeMode: Text.Fit
                font.pixelSize: height
                horizontalAlignment: Text.AlignLeft//AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: " = " + mDatajson.myvalue
            }
            Text{
                id: txt3
                color: "white"
                width:(parent.width-parent.height-50)/9
                height:editRec.height-10
                anchors.verticalCenter: parent.verticalCenter
                fontSizeMode: Text.Fit
                font.pixelSize: height
                horizontalAlignment: Text.AlignLeft//AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: mDatajson.symble
            }
            Rectangle{
                id:recove
                width:height+10
                height:editRec.height-8
                anchors.verticalCenter: parent.verticalCenter
                color:editRec.color
                Image{
                    width:parent.height
                    height: width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    source:"./png/P1-SIN.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: recove.color = "#1e6fa7"
                    onReleased: recove.color = editRec.color
                    onClicked: {
                        //editvalue = myvalue
                        emit:returnClicked(1)
                    }
                }
            }
        }
    }
    DropShadow {
        anchors.fill: editRec
        horizontalOffset: 0
        verticalOffset: 0
        radius: 8
        samples: 17
        color: "#35322f"//"#aa000000"//"#20000000"
        spread: 0.0
        source: editRec
    }


//    Connections{
//        target: myKeyboard
//        onKeyModelChanged: {
//            if(true){
//                listModel.anchors.bottomMargin = -15;
//                chineseRow.anchors.bottomMargin = -15;
//                keyboard.height = 70;
//            }
//            else{
//                listModel.anchors.bottomMargin = 0;
//                chineseRow.anchors.bottomMargin = 0;
//                keyboard.height = 35;
//            }

//            if(myKeyboard.isChineseInput())
//                chineseRow.visible = true;
//            else
//                chineseRow.visible = false;
//            listModel.model = myKeyboard.getKeyModel();
//        }
//    }

    //Behavior on x { SmoothedAnimation { velocity: 1300 } }
    //Behavior on y { SmoothedAnimation { velocity: 10} }
}

