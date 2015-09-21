import QtQuick 2.2
import QtQuick.Dialogs 1.1

Rectangle {
    id: rectangle1
    width: 460
    height: 560
    color: "#7c5213"

    property var counter_total_snt: 0
    property var counter_total_rcv: 0

    //var counter_total_rcv;
    //Component.onCompleted: {
    //    counter_total_rcv = 0;
    //}

    function myDebug(text){
        if (nList1.lmodel.count>2000) {
            nList1.lmodel.clear();
        }
        nList1.lmodel.append({name:text});
    }

    function myListAddData(text){
        if (nList1.lmodel.count>2000) {
            nList1.lmodel.clear();
        }

        counter_total_rcv++;
        console.log("addListViewData: " + text)
        nList1.lmodel.append({name:"Received("+counter_total_rcv+") : "+text});
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }

    RButton {
        id: rButtonConnect
        x: 20
        y: 515
        width: 150
        height: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        buttonText: "Connect & Listen"

        onClicked:  {
            myNeaSocket.InitSocket(colInputRIP.txt,colInputLPort.txt,colInputRPort.txt);
            myNeaSocket.StartListenService();//   messageDialog.show(qsTr("Button 1 pressed"))
            //messageDialog.show(qsTr("Button rButtonSend clicked !!!"));
        }
    }

    RButton {
        function factorial(a) {
            a = parseInt(a);
            if (a <= 0)
                return 1;
            else
                return a * factorial(a - 1);
        }

        id: rButtonSend
        x: 20
        y: 10
        width: 150
        height: 30
        buttonText: "Send Remote"

        //var counter_total_snt;
        //Component.onCompleted: {
        //    counter_total_snt = 0;
        //}

        onClicked:  {
            var i;
            for (i=0; i<parseInt(colInputTimes.txt); i++) {
                counter_total_snt++;
                myDebug(counter_total_snt+" Sending : "+inputmsg.txt);
                myNeaSocket.Send_Message(inputmsg.txt,colInputRIP.txt,colInputRPort.txt);
                //nList1.lmodel.append({name:"Sending : "+inputmsg.txt});
            }
        }
    }

    ColInput {
        id: colInputRIP
        x: 20
        y: 484
        width: 150
        height: 25
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 51
        txt: "127.0.0.1"
    }

    ColInput {
        id: colInputRPort
        x: 185
        y: 484
        width: 60
        height: 25
        color: "#f5faeb"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 51
        txt: "8060"
    }

    ColInput {
        id: colInputLPort
        x: 185
        y: 520
        width: 60
        height: 25
        color: "#f5faeb"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        txt: "8010"
    }

    RButton {
        id: rButtonChange
        x: 263
        y: 484
        width: 61
        height: 61
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        buttonText: "X"

        onClicked:  {
            var tmpbuf = colInputLPort.txt;
            colInputLPort.txt = colInputRPort.txt;
            colInputRPort.txt = tmpbuf;
        }
    }

    ColInput {
        id: inputmsg
        y: 10
        width: 164
        height: 30
        txt: "Hello world"
        anchors.left: parent.left
        anchors.leftMargin: 276
        anchors.horizontalCenterOffset: 128
        anchors.horizontalCenter: parent.horizontalCenter

    }

    ColInput {
        id: colInputTimes
        x: 185
        y: 10
        width: 60
        height: 30
        txt: "10"
    }

    NList {
        id: nList1
        objectName: "nList1"
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 90
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    RButton {
        id: rButtonClear
        x: 340
        y: 484
        width: 100
        height: 30
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 46
        buttonText: "Clear"

        onClicked:  {
            nList1.lmodel.clear();
            counter_total_snt = 0;
            counter_total_rcv = 0;

        }
    }

}
