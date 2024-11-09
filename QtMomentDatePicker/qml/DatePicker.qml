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

    //Properties
    property string selectedDate: "2024/11/09"
    //Signals
    signal clear()

    Component.onCompleted: {
        determineDate()
    }

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

        ColumnLayout{
            spacing: 0

            RowLayout{
                spacing: 2

                DatePickerCell{
                    text: "Su"
                    weight: Font.DemiBold
                }
                DatePickerCell{
                    text: "Mo"
                    weight: Font.DemiBold
                }
                DatePickerCell{
                    text: "Tu"
                    weight: Font.DemiBold
                }
                DatePickerCell{
                    text: "We"
                    weight: Font.DemiBold
                }
                DatePickerCell{
                    text: "Th"
                    weight: Font.DemiBold
                }
                DatePickerCell{
                    text: "Fr"
                    weight: Font.DemiBold
                }
                DatePickerCell{
                    text: "Sa"
                    weight: Font.DemiBold
                }
            }

            Flow{
                id: flow
                Layout.fillWidth: true
                spacing: 2

                Repeater{
                    model: daysModel
                    delegate: DatePickerCell{
                        id: rootDelegate
                        text: String(value)
                        isToday: today

                        onClicked: {
                            root.clear()
                            selected= true
                        }

                        Connections{
                            target: root
                            onClear: {
                                rootDelegate.selected= false
                            }
                        }
                    }
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

    //Data models
    ListModel{
        id: daysModel
    }
    ListModel{
        id: monthModel
        ListElement{
            value: "January"
        }
        ListElement{
            value: "February"
        }
        ListElement{
            value: "March"
        }
        ListElement{
            value: "April"
        }
        ListElement{
            value: "May"
        }
        ListElement{
            value: "June"
        }
        ListElement{
            value: "July"
        }
        ListElement{
            value: "September"
        }
        ListElement{
            value: "October"
        }
        ListElement{
            value: "November"
        }
        ListElement{
            value: "December"
        }
    }
    ListModel{
        id: yearModel
        ListElement{
            value: "2024"
        }
        ListElement{
            value: "2025"
        }
        ListElement{
            value: "2026"
        }
        ListElement{
            value: "2027"
        }
        ListElement{
            value: "2028"
        }
        ListElement{
            value: "2029"
        }
    }

    //Functions
    function determineDate(){
        daysModel.clear()
        const momentSelectedDate= M.moment(selectedDate)
        const currentDate= M.moment(selectedDate).date() //1-31
        let firstDayOfMonth = momentSelectedDate.startOf('month');
        let firstDayWeekday = firstDayOfMonth.day();


        for(var i=-firstDayWeekday; i<momentSelectedDate.daysInMonth(); i++){
            if(i<0)
                daysModel.append({
                                     value: "",
                                     today: false
                                 })
            else
                daysModel.append({
                                     value: (i+1).toString(),
                                     today: currentDate===(i+1)
                                 })
        }
    }
}
