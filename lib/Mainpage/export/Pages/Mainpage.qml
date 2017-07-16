/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

Rectangle {
    id: m_page
    width:p_width
    height:p_height
    //width: 1024; height: 768;//color: "#CCCCCC"
    color:"#F5F5F5"
    property variant p_width
    property variant p_height
    signal iconClicked(variant x);

    function log(message) {
        console.log(message);
    }

    Grid{
        id:grid
        rows:2
        columns:4
        anchors.centerIn: parent
        rowSpacing:120
        columnSpacing: 60
        Repeater {
            model: ListModel {
                ListElement { title: "程序列表";   source: "images/programlist.png" }
                ListElement { title: "模具管理";   source: "images/moju.png" }
                ListElement { title: "轴位置修改"; source: "images/positionchange.png" }
                ListElement { title: "用户参数";   source: "images/user.png" }
                ListElement { title: "机床参数";   source: "images/jichuangcanshu.png" }
                ListElement { title: "数据传输";   source: "images/shujuchuanshu.png" }
                ListElement { title: "系统管理";   source: "images/xitongguanli.png" }
                ListElement { title: "诊断界面";   source: "images/diag.png" }
            }
            Rectangle {
                id:titleRect
                width: 150
                height: 150
                color:m_page.color
//                border.color: "lightsteelblue"
//                border.width: 4
//                radius: 8
                Image{
                    id:topImg
                    anchors.horizontalCenter: parent.horizontalCenter
                    y:4
                    source: model.source
                }
                Text{
                    id:listtitle
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top:topImg.bottom
                    anchors.topMargin: 7
                    text:model.title
                    font.pixelSize: 25
                    font.family: "Ubuntu"
                    font.bold: true
                    color: 'black'
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        emit:iconClicked(index)
                    }
                    onPressed: {
                        topImg.scale=0.9
                        listtitle.scale=0.9
                        listtitle.color='red'
                    }

                    onReleased:{
                        topImg.scale=1
                        listtitle.scale=1
                        listtitle.color='black'
                    }

                }
                Material.background: {
                    switch(index){
                    case 0: return Material.Teal
                    case 1: return Material.Red
                    case 2: return Material.Blue
                    case 3: return Material.DeepOrange
                    case 4: return Material.Green
                    case 5: return Material.Purple
                    case 6: return Material.Indigo
                    case 7: return Material.Lime

                    }
                }
                Material.foreground: {
                    switch(index){
                    case 5: return Material.Teal
                    case 6: return Material.Red
                    case 7: return Material.Green
                    case 0: return Material.Purple
                    case 1: return Material.Indigo
                    case 2: return Material.Lime
                    case 3: return Material.Blue
                    case 4: return Material.DeepOrange
                    }
                }
                //fontHeight: 0.4

//                onClicked: {
//                        emit:iconClicked(index)
//                }

            }
        }
    }

    Text{
        x:m_page.width-410
        y:m_page.height-40
        //style:Text.Outline
        text:"南京固邦电子科技有限公司 CopyRight © 2017-2022"
        font.pixelSize: 16
        font.bold: true
        color:"#CC3399"
    }
}
