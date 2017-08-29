import QtQuick 2.0

Item {
    property QtObject firstRowModel: first
    property QtObject secondRowModel: second
    property QtObject thirdRowModel: third
    property QtObject numModel: num

    ListModel {
        id:first
        ListElement { letter: "q"; firstSymbol: "1"; keycode: Qt.Key_Q}
        ListElement { letter: "w"; firstSymbol: "2"; keycode: Qt.Key_W}
        ListElement { letter: "e"; firstSymbol: "3"; keycode: Qt.Key_E}
        ListElement { letter: "r"; firstSymbol: "4"; keycode: Qt.Key_R}
        ListElement { letter: "t"; firstSymbol: "5"; keycode: Qt.Key_T}
        ListElement { letter: "y"; firstSymbol: "6"; keycode: Qt.Key_Y}
        ListElement { letter: "u"; firstSymbol: "7"; keycode: Qt.Key_U}
        ListElement { letter: "i"; firstSymbol: "8"; keycode: Qt.Key_I}
        ListElement { letter: "o"; firstSymbol: "9"; keycode: Qt.Key_O}
        ListElement { letter: "p"; firstSymbol: "0"; keycode: Qt.Key_E}
    }
    ListModel {
        id:second
        ListElement { letter: "a"; firstSymbol: "!"}
        ListElement { letter: "s"; firstSymbol: "@"}
        ListElement { letter: "d"; firstSymbol: "#"}
        ListElement { letter: "f"; firstSymbol: "$"}
        ListElement { letter: "g"; firstSymbol: "%"}
        ListElement { letter: "h"; firstSymbol: "&"}
        ListElement { letter: "j"; firstSymbol: "*"}
        ListElement { letter: "k"; firstSymbol: "?"}
        ListElement { letter: "l"; firstSymbol: "/"}
    }
    ListModel {
        id:third
        ListElement { letter: "z"; firstSymbol: "_"}
        ListElement { letter: "x"; firstSymbol: "\""}
        ListElement { letter: "c"; firstSymbol: "'"}
        ListElement { letter: "v"; firstSymbol: "("}
        ListElement { letter: "b"; firstSymbol: ")"}
        ListElement { letter: "n"; firstSymbol: "-"}
        ListElement { letter: "m"; firstSymbol: "+"}
    }
    ListModel{
        id:num
        ListElement { letter:"7"}
        ListElement { letter:"8"}
        ListElement { letter:"9"}
        ListElement { letter:"4"}
        ListElement { letter:"5"}
        ListElement { letter:"6"}
        ListElement { letter:"1"}
        ListElement { letter:"2"}
        ListElement { letter:"3"}
        ListElement { letter:"."}
        ListElement { letter:"0"}
        ListElement { letter:"-"}
    }
}

