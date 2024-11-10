import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/moment.js" as M

Item{
    width: parent.width
    height: mainColumn.height

    ColumnLayout{
        id: mainColumn
        spacing: 0
        width: parent.width

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
                        const momentSelectedDate= M.moment(selectedDate)
                        let firstDayOfMonth = momentSelectedDate.startOf('month');
                        let firstDayWeekday = firstDayOfMonth.day();
                        selectedDate= M.moment(selectedDate).date(index+1-firstDayWeekday).format("YYYY/MM/DD")
                    }

                    Connections{
                        target: root
                        function onClear(){
                            rootDelegate.selected= false
                        }
                    }
                }
            }
        }
    }
}
