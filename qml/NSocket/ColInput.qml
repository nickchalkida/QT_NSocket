import QtQuick 2.2

Rectangle {
    id: rectangle1
    width: 100
    height: 30
    color: "#cccfbf"
    radius: 4
    property alias txt: textEdit1.text

    TextEdit {
        id: textEdit1
        x: 0
        y: 8
        width: 100
        height: 25
        text: qsTr("Text Edit")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        transformOrigin: Item.Center
        z: 1
        font.pointSize: 12
        horizontalAlignment: TextEdit.AlignHCenter
        font.pixelSize: 14
    }
}
