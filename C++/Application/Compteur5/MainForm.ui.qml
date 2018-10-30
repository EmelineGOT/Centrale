import QtQuick 2.5

Rectangle {
    id: rectangle1

    width: 320
    height: 240
    color: "#e02d2d"
    radius: 16
    border.width: 7
    border.color: "#000000"

    Rectangle {
        id: rectangle
        x: 99
        y: 64
        width: 100
        height: 50
        color: "#148c14"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#337810"

        Text {
            id: text1
            x: 37
            y: 18
            width: 100
            height: 50
            //text: qsTr("Text 3")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Tahoma"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 24
            focus: true
            text: vueObjetCpt.cptQML

            Keys.onPressed: {
              switch (event.key) {
                case Qt.Key_Up:
                  vueObjetCpt.increment();
                  break;
                case Qt.Key_Down:
                  vueObjetCpt.decrement();
                  break;
              }
            }
        }
    }
}
