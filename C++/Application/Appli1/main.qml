import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 330
    height: 300
    title: qsTr("Transitions")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent
        id: page

        mouseArea1 {
            onClicked: stateGroup.state = ' '
        }

        mouseArea2 {
            onClicked: stateGroup.state = 'State1'
        }

        mouseArea3 {
            onClicked: stateGroup.state = 'State2'
        }



    }

    StateGroup {
        id: stateGroup
        states: [
            State{
                name:"State1"
                PropertyChanges{
                    target:page.icon
                    x: page.middleRightRect.x
                    y:page.middleRightRect.y
                }
            },
            State{
                name:"State2"
                PropertyChanges{
                    target:page.icon
                    x: page.bottomLeftRect.x
                    y: page.bottomLeftRect.y
                }
            }

        ]

        transitions: [
            Transition {
                from: "*"; to: "State1"
                NumberAnimation{
                    easing.type: Easing.OutBounce
                    properties: "x,y";
                    duration: 1000
                }
            },

            Transition{
                from: "*"; to: "State2"
                NumberAnimation{
                    duration: 2000
                    easing.type: Easing.InOutQuad;
                    properties: "x,y";

                }
            },

            Transition{
                NumberAnimation{
                    duration: 200;
                    properties: "x,y";

                }
            }

        ]
    }


    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
