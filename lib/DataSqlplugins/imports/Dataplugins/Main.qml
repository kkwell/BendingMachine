import QtQuick 2.7
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"
import QtQuick.Controls.Material 2.0
import Qt.labs.settings 1.0
import "Datalist"
import "Datastep"
import "Mouldlist"
import "StartBending"

Rectangle {
    width: p_width; height: p_height;
    color: "transparent"
    
    property variant swipeindex
    property variant p_width
    property variant p_height
    //property variant typenum
    property variant mDatajson
    property int selectindex:0//当前选中行索引
    
    signal returnClicked(variant type);
    signal returnSwipeviewChanged(variant index);
    function setvalue(){
        var i=0
        for(i;i<9;i++){
            if(lrepeatermodel.get(i).sqlname===mDatajson.sqltitlename){
                lrepeatermodel.setProperty(i,"ttest",mDatajson.myvalue)
                break;
            }
        }
    }
    ListModel{
        id:lrepeatermodel
        ListElement { name: "名 称";     tip:"TextField";ttest:"";test:"";    unit:""; sqlname:"name"}
        ListElement { name: "上 模";     tip:"TextField";ttest:"";test:"";    unit:""; sqlname:"topmould"}
        ListElement { name: "板 宽";     tip:"00.00";    ttest:"";test:"" ;   unit:"mm";sqlname:"widthness"}
        ListElement { name: "下 模";     tip:"TextField";ttest:"";test:"";    unit:"";  sqlname:"bottommould"}
        ListElement { name: "板 厚";     tip:"00.00";    ttest:"";test:"";    unit:"mm";sqlname:"thickness"}
        ListElement { name: "上死点";    tip:"00.00";     ttest:"";test:"";   unit:"mm";sqlname:"shangsidian"}
        ListElement { name: "材 料";     tip:"TextField";ttest:"";test:"";    unit:"";sqlname:"material"}
        ListElement { name: "转速点";    tip:"00.00";     ttest:"";test:"";   unit:"mm";sqlname:"zhuansudian"}
        ListElement { name: "夹紧点";    tip:"00.00";     ttest:"";test:"";   unit:"mm";sqlname:"jiajindian"}
    }
    SwipeView {
        id: swipeView
        width: parent.width
        height: parent.height
        currentIndex: swipeindex
        onCurrentIndexChanged: {
            emit:returnSwipeviewChanged(swipeView.currentIndex)
        }

        Item{
            width:swipeView.width
            height: swipeView.height
            Data {

            }
        }
        Item{
            width:swipeView.width
            height: swipeView.height
            Datastep {

            }
        }
        Item{
            width:swipeView.width
            height: swipeView.height
            StartBending {

            }
        }
        Item{
            width:swipeView.width
            height: swipeView.height
            Mouldpage {

            }
        }
    }
}

