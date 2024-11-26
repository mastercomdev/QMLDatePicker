# Date Picker Component README

## Overview
This project is a custom **Date Picker** component built using **Qt Quick** and **Qt Quick Controls**. It allows the user to select a date by navigating through years, months, and days. The component provides a clean and interactive popup with options to cancel or confirm the date selection.

## Features

- **Modal Popup**: Displays as a modal dialog centered on the screen.
- **Year, Month, Day Navigation**: Allows the user to navigate between years, months, and days.
- **Current Date Highlight**: The currently selected date is visually highlighted.
- **Date Formats**: Handles dates in the format `YYYY/MM/DD`.
- **Cancel and Ok Buttons**: Includes buttons to either cancel or confirm the selection.
- **Customizable**: You can change the initial selected date and modify the available year and month ranges.

## Structure

### Main Component: `Popup`
- **Popup**: A modal dialog that contains the date picker UI.
  - **Properties**:
    - `selectedDate`: The currently selected date (default: "2024/11/09").
    - `backupSelectedDate`: Backup for the selected date to restore if the user cancels the selection.
    - `view`: A string to represent the current view, such as "Date", "Month", or "Year".
  - **Signals**:
    - `clear()`: Emitted when the user cancels the selection.
    - `accepted()`: Emitted when the user accepts the selection.
    - `rejected()`: Emitted when the user cancels the selection.
  - **Components**:
    - **ColumnLayout**: Contains labels, buttons, and the date picker layout.
    - **Loader**: Dynamically loads different views based on the current `view` property (Date, Month, or Year).

### Data Models
- **daysModel**: Model for storing days of the month.
- **monthModel**: Model for storing the month names (January to December).
- **yearModel**: Model for storing a list of years to navigate through.

## Functions

- `determineDate()`: Updates the `daysModel` with the days of the current month based on the selected date.
- `nextMonth()`: Increments the selected date by one month and updates the view.
- `prevMonth()`: Decrements the selected date by one month and updates the view.

## Usage

### Properties

- **selectedDate**: Set this property to specify the initially selected date in the format `YYYY/MM/DD`.
- **backupSelectedDate**: This property holds the initial selected date before any changes are made. It is used when the user cancels the selection.
- **view**: Controls the view mode of the date picker. It can be set to:
  - `"Date"`: Shows the day picker.
  - `"Month"`: Shows the month picker.
  - `"Year"`: Shows the year picker.

### Signals

- **clear()**: This signal is triggered when the user cancels the operation.
- **accepted()**: This signal is triggered when the user confirms the selection.
- **rejected()**: This signal is triggered when the user rejects the selection.

### Example:

```qml
DatePicker {
    selectedDate: "2024/11/09"
    onAccepted: {
        console.log("Selected date:", selectedDate)
    }
    onRejected: {
        console.log("Date selection canceled")
    }
}
```

## File Breakdown

- **Popup**: Main container for the Date Picker.
- **ColumnLayout**: Organizes the layout of the UI elements inside the popup.
- **RowLayout**: Used for navigation buttons (`<`, `>`, etc.).
- **Loader**: Dynamically loads different QML components based on the selected view.

## Customization

1. **Year, Month, and Day Models**: You can extend or modify the `yearModel`, `monthModel`, and `daysModel` to fit your requirements. 
   - For example, you can change the range of available years, or modify the format of the month names.
2. **Styles and Themes**: You can adjust the styling (font, colors, sizes) to fit your application’s theme.
3. **Date Parsing**: The component uses **Moment.js** for date parsing and manipulation. You can replace it with a custom date library or logic if desired.

## Dependencies
- **Qt Quick 2.15**
- **Qt Quick Controls 2.15**
- **Qt Quick Layouts 1.15**
- **Moment.js** (`qrc:/qml/moment.js`) for date manipulation.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Contributing
Feel free to fork this project, report issues, and submit pull requests. If you encounter bugs or have suggestions for improvements, please open an issue.

---

**Enjoy your interactive date picker!** 🎉