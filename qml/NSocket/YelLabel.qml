import QtQuick 2.2

Item {
    width: 200
    height: 30
    property alias heytxt: ltext.text

    Rectangle{
    width: 200
    height: 30
    color: "#dce944"
    radius: 4
    border.width: 1

    Text {
        id: ltext
        x: 88
        y: 7
        text:"hello"
        z: 1
        color: "#1c1e14"
        clip: false
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }
    }
}
