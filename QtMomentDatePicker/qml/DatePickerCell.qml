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

    Rectangle{
        color: "#64B5F6"
        anchors.fill: parent
        radius: 2
        opacity: isToday ? 1 : 0

        Behavior on opacity {
            NumberAnimation{}
        }
    }

    Label{
        anchors.fill: parent
        horizontalAlignment: "AlignHCenter"
        verticalAlignment: "AlignVCenter"
        text: root.text
    }
}
