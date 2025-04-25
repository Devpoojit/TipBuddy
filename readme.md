# Tip Calculator iOS App

A beautiful, minimal tip calculator app built with SwiftUI for iOS devices.

![Tip Calculator App Screenshot](/tip_buddy)

## My First iOS App Journey

When I decided to create my first iOS app, I wanted to build something practical that would solve an everyday problem while helping me learn SwiftUI fundamentals. The Tip Calculator became the perfect starting point - simple enough to complete as a beginner, yet complex enough to teach me core concepts like state management, animations, and UI design.

Building this app taught me how to create responsive layouts, implement user input handling, perform calculations in real-time, and add subtle animations that enhance the user experience. The most challenging part was perfecting the minimal design - finding that balance between beauty and functionality took several iterations.

What started as a learning project has become an app I use regularly when dining out. I'm proud of how it turned out and excited to continue my iOS development journey!

## Features

- Clean, minimal UI design with smooth animations
- Calculate tip amount based on bill total
- Choose from preset tip percentages (15%, 20%, 25%)
- Enter custom tip percentage
- See calculated tip amount and total bill
- Responsive design that works on all iPhone sizes
- Support for dark mode

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

1. Clone this repository
   ```bash
   git clone https://github.com/yourusername/tip-calculator.git
   ```

2. Open the project in Xcode
   ```bash
   cd tip-calculator
   open TipCalculator.xcodeproj
   ```

3. Build and run the application on your simulator or device

## Implementation Details

The app is built using:

- SwiftUI for the user interface
- MVVM architecture pattern
- Computed properties for calculations
- SwiftUI animations for a polished experience

## Code Structure

- `ContentView.swift`: Main view containing the entire UI and logic
- Uses SwiftUI's `@State` property wrappers for managing state
- Implements responsive design using flexible layouts

## Future Enhancements

- Bill splitting functionality
- Saving favorite tip percentages
- History of previous calculations
- Receipt scanning capability

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Thanks to [Apple's SwiftUI documentation](https://developer.apple.com/documentation/swiftui)
- Inspired by iOS design principles and best practices