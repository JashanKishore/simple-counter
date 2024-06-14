# 🧮 SimpleCounter

A SwiftUI-based simple counter app with a customizable increment value, history log, dark mode support, and more. This project is designed to help understand the basics of SwiftUI, state management, and data persistence using `UserDefaults`.

## 📦 Technologies

- SwiftUI
- Swift
- UserDefaults

## 🦄 Features

Here's what you can do with SimpleCounter:

### Increment and Decrement
- **Increment**: Increase the counter by a customizable value.
- **Decrement**: Decrease the counter by a customizable value.

### Reset Counter
- **Reset**: Set the counter back to zero with a confirmation alert.

### Custom Increment Value
- **Customize Increment**: Set a custom increment value in the settings menu.

### History Log
- **History Log**: View a log of all counter changes, including increments, decrements, and resets, with timestamps.
- **Clear History**: Clear the entire history log with a confirmation alert.

### Dark Mode
- **Dark Mode Support**: The app adapts to the system's dark mode settings, providing a seamless user experience.

## 🎯 Keyboard Shortcuts
- **Increment**: Tap the "Increment" button.
- **Decrement**: Tap the "Decrement" button.
- **Reset**: Tap the "Reset" button and confirm the action.
- **History Log**: Tap the "History Log" button to view the history.
- **Settings**: Tap the settings icon to customize the increment value.

## 👩🏽‍🍳 The Process

### Initial Setup
Started with setting up the SwiftUI environment and creating the basic counter interface with increment, decrement, and reset functionalities.

### State Management
Implemented state management using `@State` and `@EnvironmentObject` for the counter value and settings.

### Data Persistence
Used `UserDefaults` to save the increment value and counter value, ensuring data persistence across app launches.

### History Log
Added a history log feature to track counter changes, displayed in a `List`. Used `@Published` properties to manage the history log state.

### Customization and Dark Mode
Implemented settings to allow users to customize the increment value and added dark mode support to provide a better user experience.

### Alerts and Confirmations
Added confirmation alerts for reset and clear history actions to prevent accidental data loss.

## 📚 What I Learned

### State Management
- **@State and @EnvironmentObject**: Learned how to use these property wrappers to manage state across the app.

### Data Persistence
- **UserDefaults**: Gained experience in persisting data locally using `UserDefaults`.

### SwiftUI Components
- **List and Navigation**: Improved skills in using `List`, `NavigationView`, and `NavigationLink` for building SwiftUI interfaces.

### Animations
- **SwiftUI Animations**: Implemented smooth animations for various state changes in the app.

### Dark Mode
- **Adaptive UI**: Learned to create a UI that adapts to both light and dark modes seamlessly.

### Alerts
- **Confirmation Alerts**: Implemented custom alert views for reset and clear history actions, enhancing user experience.

## 💭 How can it be improved?
- Add more customizable settings such as different themes.
- Enhance the history log with more detailed actions.
- Implement additional counter-related functionalities.
- Improve accessibility for a wider range of users.

## 🚦 Running the Project

To run the project in your local environment, follow these steps:

1. **Clone the repository to your local machine**:
   ```sh
   git clone https://github.com/your-username/SimpleCounter.git
   ```
2. **Open the project in Xcode**:
   - Navigate to the project directory and open the `.xcodeproj` file with Xcode.
3. **Install dependencies**:
   - Make sure you have Xcode installed with the necessary SwiftUI components.
4. **Run the app**:
   - Select your target device (simulator or physical device) and run the app using the play button in Xcode.
