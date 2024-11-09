import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/moment.js" as M

Item{
    id: root
    width: (flow.width-flow.spacing*6)/7
    height: width

    //Properties
    property string text: "-1"
    property bool isToday: false
    property bool selected: false
    property alias weight: label.font.weight
    //Signals
    signal clicked()

    Rectangle{
        color: "#64B5F6"
        anchors.fill: parent
        radius: 4
        opacity: isToday ? 1 : 0

        Behavior on opacity {
            NumberAnimation{}
        }
    }

    Rectangle{
        anchors.fill: parent
        border.width: 1.5
        border.color: isToday ? Qt.lighter("#64B5F6", 1.2) : "#64B5F6"
        color: "transparent"
        radius: 4
        opacity: selected ? 1 : 0

        Behavior on opacity {
            NumberAnimation{}
        }
    }

    Label{
        id: label
        anchors.fill: parent
        horizontalAlignment: "AlignHCenter"
        verticalAlignment: "AlignVCenter"
        text: root.text
        color: isToday ? "white" : "black"
    }

    Button{
        anchors.fill: parent
        flat: true
        topInset: 0
        bottomInset: 0
        enabled: root.text

        onClicked: {
            root.clicked()
        }
    }
}
