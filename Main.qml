import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Animation")

    color: "#202020"

    Rectangle {
        id: myRect
        anchors.centerIn: parent
        width: 150
        height: 150
        color: "gold"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            state: "weExited"

            states: [
                State {
                    name: "weHovered"
                    PropertyChanges {
                        target: myRect
                        color: "lightgreen"
                        scale: 2
                    }
                },
                State {
                    name: "weExited"
                    PropertyChanges {
                        target: myRect
                        color: "blue"
                        scale: 1
                    }
                }

            ]

            transitions: [
                Transition {
                    from: "weExited"
                    to: "weHovered"

                    ParallelAnimation {
                        NumberAnimation {
                            property: "scale"
                            duration: 600
                        }

                        ColorAnimation {
                            property: "color"
                            duration: 600
                        }
                    }
                },
                Transition {
                    from: "weHovered"
                    to: "weExited"

                    ParallelAnimation {
                        NumberAnimation {
                            property: "scale"
                            duration: 600
                        }


                        ColorAnimation {
                            property: "color"
                            duration: 600
                        }
                    }
                }

            ]

            onEntered: {
                mouseArea.state = "weHovered"
            }

            onExited: {
                mouseArea.state = "weExited"
            }
        }
    }
}
