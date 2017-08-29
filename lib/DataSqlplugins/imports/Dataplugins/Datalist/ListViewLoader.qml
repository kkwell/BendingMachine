import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Rectangle{
    width: 920
    height: parent.height
    color:"#00000000"
    function setlrepeatermodel(jsonData,ourIndex){
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

    Column {
        width: 920
        height: parent.height
        //anchors.top: topRow.bottom
        x:10
        Rectangle{
            width:parent.width
            height:240
            color:"white"

            ListView {
                id: listView
                width: parent.width
                height: 240
                clip: true
                model: mDatajson
                currentIndex:mDatajson.selectindex
                focus:true
                //highlightRangeMode:ListView.StrictlyEnforceRange
                delegate: Loader {
                    id: delegateLoader
                    width: listView.width
                    sourceComponent: swipeDelegateComponent

                    property ListView view: listView
                    property int ourIndex: index
                    property var jsonData: json
                    //property int mDatajson.selectindex: mDatajson.selectindex

                    // Can't find a way to do this in the SwipeDelegate component itself,
                    // so do it here instead.
                    ListView.onRemove: SequentialAnimation {
                        PropertyAction {
                            target: delegateLoader
                            property: "ListView.delayRemove"
                            value: true
                        }
                        NumberAnimation {
                            target: item
                            property: "height"
                            to: 0
                            easing.type: Easing.InOutQuad
                        }
                        PropertyAction {
                            target: delegateLoader
                            property: "ListView.delayRemove"
                            value: false
                        }
                    }
                }
                //onCurrentIndexChanged: console.log("ssx",currentIndex)
            }
        }
        Row{
            width:parent.width
            height: 70
            spacing:690
            Text {
                width:100
                height:parent.height
                text:"参   数"
                font.pixelSize: 23
                verticalAlignment: Text.AlignVCenter
            }
            Text{
                width:100
                height:parent.height-30
                text:"页:"+mDatajson.pagenum+"/"+Math.ceil(mDatajson.databasenum/8)+"    总数:"+mDatajson.databasenum
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 17
            }

        }

        Grid {
            id:mgrid
            x:110
            y:30
            width: parent.width
            height: parent.height-listView.height-30
            columnSpacing: 150
            rowSpacing: 20
            rows: 5
            columns: 2


            Repeater {
                id:lrepeater
                model:lrepeatermodel

                Rectangle{
                    width:300
                    height:30
                    color:mpane.color
                    Label {
                        id:firstname
                        width: 65
                        y:5
                        text: name
                        font.pixelSize: 18
                    }
                    TextField {
                        id:mtextfield
                        width: 100
                        height: 42
                        placeholderText: tip
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.left: firstname.right
                        font.pixelSize: 18
                        text:ttest//mtextfield.activeFocus?mDatajson.editvalue:""
                        onActiveFocusChanged: {
                            if(mtextfield.activeFocus){
                                mDatajson.editname = name
                                mDatajson.editvalue = ttest
                                mDatajson.myvalue = test
                                mDatajson.symble = unit
                                mDatajson.sqltitlename = sqlname
                                //emit:returnClicked(test)
                            }
                        }
                        onDisplayTextChanged: {
                            mDatajson.editvalue = mtextfield.text
                            //console.log(mfoc)
                            //emit:returnClicked(textname.text)
                        }
                    }

                    Label{
                        id:originvalue
                        width:100
                        height:35
                        text:"   = "+test+"    "+unit
                        font.pixelSize: 18
                        anchors.left: mtextfield.right
                    }
                }
                Keys.onPressed: {
                    if(index==8&&event.key===Qt.Key_Tab){
                        console.log("tab")
                        //lrepeater.itemAt(0).mtextfield.focus = true
                        //lrepeatermodel.setProperty(0, "mfoc", true)
                        //mtextfield.
                        mtextfield.onActiveFocusChanged()

                    }
                }
            }


        }


    }

    Component {
        id: swipeDelegateComponent

        Rectangle {
            id: swipeDelegate
            height: 30
            width: mwidth
            color: listView.currentIndex==ourIndex?"lightblue":"#ffffff"
            border.color: Qt.lighter(color, 1.1)

            Row{
                anchors.fill: parent
                spacing: 0
                Rectangle{
                    width: 10
                    height: 10
                    x:15
                    y:10
                    opacity:jsonData.draw==="1"?1:0
                    color: "green"
                }

                Text{
                    width:60
                    height: parent.height
                    text:(mDatajson.pagenum-1)*8+ourIndex+1//jsonData.id
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 16
                }
                Text{
                    width:200
                    height:parent.height
                    text:jsonData.name//"Bending Box one"
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:45
                    height:parent.height
                    text:jsonData.stepnum
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.widthness
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.thickness
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.material
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75//repeater.itemAt(3).width
                    height:parent.height
                    text:jsonData.topmould
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Text{
                    width:75
                    height:parent.height
                    text:jsonData.bottommould
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:70
                    height:parent.height
                    text:jsonData.workednum
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text{
                    width:160
                    height:parent.height
                    text:jsonData.edittime//"2017/6/26 17:30"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            MouseArea {
                id:mClickedArea
                anchors.fill: parent
                onClicked:{
                    mDatajson.selectindex = ourIndex;
                    setlrepeatermodel(jsonData,ourIndex);
                    //                listView.remove.objectName("id");
                    //                mDatajson.minsert(2);//mDatajson

                    //mDatajson.setData(mDatajson.index(ourIndex,0),"fe",1)
                }
            }
            Component.onCompleted:{
                if(listView.currentIndex == ourIndex){
                    setlrepeatermodel(jsonData,ourIndex);
                }
            }

            Component {
                id: removeComponent
                Rectangle {
                    color: SwipeDelegate.pressed ? "#333" : "#444"
                    width: parent.width
                    height: parent.height
                    clip: true

                    Label {
                        font.pixelSize: swipeDelegate.font.pixelSize
                        text: "Remove"
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
            }
        }


    }


}
