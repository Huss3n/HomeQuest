# HomeQuest
## Description
HomeQuest is a comprehensive iOS application designed to enhance the real estate search experience. Users can browse properties, bookmark their favorites, chat with realtors, and leave reviews. 
This project is built using SwiftUI and integrates with Firebase for authentication and data management.

## Features
- User Roles: Choose to be a realtor or a browser from the profile menu.
- Property Listings: Browse through various property listings with detailed information.
- Bookmark Properties: Save your favorite properties for easy access later.
- Chat Interface: Chat directly with realtors to inquire about properties.
- Reviews and Ratings: Leave reviews and ratings for realtors and properties to help the community.
- Tour Scheduling: Book, schedule, cancel, reschedule, and rebook property tours.
- Offline Reply for Realtors: Realtors can set an automated offline reply message.
- Map Browsing: Browse properties on a map and view details via a pop-up sheet.
- Direct Calls: Call realtors directly from the app.
- Clear Chats: Clear chat history with realtors.
- Report Properties: Report fraudulent properties and realtors.
- Swipe-Based Property Viewing: Swipe on properties in a view similar to Tinder or Bumble.
- Liked Properties: View and unlike properties from your profile.
- Advanced Filters: Use filters like price range, location, number of bedrooms, and more to find the perfect property.
- User Authentication: Secure login and registration using Firebase and GoogleSignIn.

## Screenshots
<p>
   <img src="https://github.com/Huss3n/HomeQuest/blob/main/Screenshots/home.png", width="200" hspace="4"/>
   <img src="https://github.com/Huss3n/HomeQuest/blob/main/Screenshots/swipe.png", width="200" hspace="4"/>
   <img src="https://github.com/Huss3n/HomeQuest/blob/main/Screenshots/swipe1.png", width="200" hspace="4"/>
   <img src="https://github.com/Huss3n/HomeQuest/blob/main/Screenshots/map.png", width="200" hspace="4"/>
   <img src="https://github.com/Huss3n/HomeQuest/blob/main/Screenshots/homedark.png", width="200" hspace="4"/>
  <img src="https://github.com/Huss3n/HomeQuest/blob/main/Screenshots/detaildark.png", width="200" hspace="4"/>
</p>

## Installation
1. Clone the repo
```
   git clone https://github.com/Huss3n/HomeQuest.git
```
2. Navigate to the project directory
```
cd HomeQuest
```
3. Open the project in Xcode:
```
open HomeQuest.xcodeproj

```
4. Install dependencies:
- Make sure you have CocoaPods installed. If not, install it using:
  ```
  sudo gem install cocoapods
  ```
- Then, install the project dependencies:
  ```
  pod install
  ```
5. Run the project
   Open the HomeQuest.xcworkspace file in Xcode, select your simulator or device, and hit the run button.

## Development
Prerequisites
- Xcode 12.0 or later
- Swift 5.3 or later
- CocoaPods

## Project Structure
HomeQuestApp.swift: The main entry point of the application.
Views: Contains SwiftUI views for different screens and components.
Models: Data models used in the application.
ViewModels: View models following the MVVM architecture.
Services: Services for handling network requests, Firebase interactions.

## Branching Strategy
- main: Production-ready code.
- development: Latest development changes.
- feature/{feature-name}: New features and enhancements.

  ## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch (feature/{feature-name}).
3. Make your changes.
4. Commit your changes (git commit -m 'Add some feature').
5. Push to the branch (git push origin feature/{feature-name}).
6. Open a pull request.
7. Fill the pull request template.

## License
This project is licensed under the Apache License 2.0. See the LICENSE file for details.

## Contact
For any inquiries or feedback, feel free to reach out at:
- Email: <a href="mailto:aisackhussein@gmail.com">Send email</a>
- GitHub: <a href="https://github.com/huss3n/">Huss3n</a>
