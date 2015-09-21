//Import the declarative plugins
import QtQuick 2.2

//Implementation of the Button control.
Item {
    id: button
    width: 100
    height: 100
    property alias buttonText: bText.text;
    scale: state === "Pressed" ? 0.96 : 1.0
    onEnabledChanged: state = ""
    signal clicked
    signal send

    //define a scale animation
    Behavior on scale {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }

    //Rectangle to draw the button
    Rectangle {
        id: recbutton
        border.width: 4
        border.color: "#771e11"
        radius: width/2
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                id: gradientStop2
                position: 0.0
                color: "#732402"
            }
            GradientStop {
                id: gradientStop1
                position: 0.25
                color: "#966400"
            }
            GradientStop {
                id: gradientStop3
                position: 1.0
                color: "#fec24e"
            }
        }

        Text {
            id: bText
            x: 24
            y: 8
            width: 43
            height: 84
            text: qsTr("herlloooo")
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            z: 2
            clip: false
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.pixelSize: 14
        }


    }

    //change the color of the button in differen button states
    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target: gradientStop3
                color: "#796648"
            }
            PropertyChanges {
                target: gradientStop2
                color: "#ffffff"
            }
            PropertyChanges {
                target: gradientStop1
                color: "#fece24"
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: gradientStop2
                color: "#e48d04"
            }
            PropertyChanges {
                target: gradientStop1
                color: "#fdb014"
            }
            PropertyChanges {
                target: gradientStop3
                color: "#dc8415"
            }
        }
    ]

    //define transmission for the states
    transitions: [
        Transition {
            from: ""; to: "Hovering"
            ColorAnimation { duration: 200 }
        },
        Transition {
            from: "*"; to: "Pressed"
            ColorAnimation { duration: 10 }
        }
    ]

    //Mouse area to react on click events
    MouseArea {
        id: mouseArea1
        width: 100
        height: 100
        hoverEnabled: true
        anchors.fill: button
        onEntered: { button.state='Hovering'}
        onExited: { button.state=''}
        onClicked: {
            button.clicked();
            send("Red Button clicked");

        }
        onPressed: { button.state="Pressed" }
        onReleased: {
            if (containsMouse)
              button.state="Hovering";
            else
              button.state="";
        }
    }
}
