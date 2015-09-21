import QtQuick 2.2

Rectangle {
    id: rectangle1
    width: 100
    height: 62
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#ffffff"
        }

        GradientStop {
            position: 1
            color: "#e1c94c"
        }
    }
    property alias lmodel: listModel;

    Component {
        id: listDelegate
//        Item {
//        width: 400; height: 20
//        Row {
//            Column {
//                 width: 400
//                 Text { text: name; styleColor: "#dc8989" }
//                }
//            }
//        }
//          Rectangle {
//          width: 400; height: 20
//          Text { text: name; styleColor: "#dc8989" }
//          }
            Item {
                  width: 400; height: 20
                  Text { text: name; styleColor: "#dc8989" }
            }


    }

    ListModel {
             id: listModel
             dynamicRoles: true
     }

    ListView {
          id: listView
          objectName: "listView"
          anchors.fill: parent; anchors.margins: 5
          model: listModel
          delegate: listDelegate
          focus: true

          onCountChanged: {
              var newIndex = count - 1 // last index
              positionViewAtEnd()
              currentIndex = newIndex
          }

    }
}

