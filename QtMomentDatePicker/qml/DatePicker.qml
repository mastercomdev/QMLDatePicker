import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/moment.js" as M

Popup {
    id: root
    x: parent.width/2-width/2
    y: parent.height/2-height/2
    width: 300
    height: mainColumn.height+padding*2
    visible: true
    modal: true

    ColumnLayout{
        id: mainColumn
        width: parent.width
        spacing: 12

        Label{
            Layout.fillWidth: true
            text: "Select Date"
            font.pointSize: 14
            font.weight: Font.Bold
        }

        RowLayout{
            Layout.alignment: Qt.AlignRight

            Button{
                text: "<"
                flat: true
            }

            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 32

                Label{
                    anchors.fill: parent
                    text: "2023"
                    horizontalAlignment: "AlignRight"
                    verticalAlignment: "AlignVCenter"
                }
            }

            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 32

                Label{
                    anchors.fill: parent
                    text: "Oct"
                    horizontalAlignment: "AlignLeft"
                    verticalAlignment: "AlignVCenter"
                }
            }


            Button{
                text: ">"
                flat: true
            }
        }

        Flow{
            id: flow
            Layout.fillWidth: true
            spacing: 2

            Repeater{
                model: 30
                delegate: DatePickerCell{
                    text: String(index)
                }
            }
        }

        RowLayout{
            Layout.alignment: Qt.AlignRight

            Button{
                text: "Cancel"
                flat: true
            }
            Button{
                text: "Ok"
                flat: true
            }
        }
    }
}
