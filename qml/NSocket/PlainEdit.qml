import QtQuick 2.2

Rectangle {
    width: 200
    height: 100
    color: "#eeede8"
    property alias txt: rtextEdit.text

    TextEdit {
        id: rtextEdit
        text: qsTr("Text Edit")
        z: 1
        anchors.fill: parent
        font.pixelSize: 12
    }
}
