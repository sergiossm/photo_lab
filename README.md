# Photo Lab

A production-ready Flutter application demonstrating best practices in mobile app development. Photo Lab allows users to edit photos with various filters and effects, showcasing a domain-driven architecture and robust state management.

---

## Table of Contents
- [Visual Identity](#visual-identity)
- [Setup Instructions](#setup-instructions)
- [Environment Setup and Configuration](#environment-setup-and-configuration)
- [Key Technical Decisions](#key-technical-decisions)
- [Feature Overview and Future Improvements](#feature-overview-and-future-improvements)

---

## Visual Identity
- Color palette:
    - Primary: ![#6200EE](https://place-hold.it/15/6200EE&text=+) `#6200EE`
    - Secondary: ![#03DAC6](https://place-hold.it/15/03DAC6) `#03DAC6`
    - Background: ![#FFFFFF](https://place-hold.it/15/FFFFFF) `#FFFFFF`
    - Text: ![#000000](https://place-hold.it/15/000000) `#000000`
- Typography:
    - Display: [Bebas Neue](https://fonts.google.com/specimen/Bebas+Neue)
    - Body: [Roboto](https://fonts.google.com/specimen/Roboto)
- Iconography: [Font Awesome](https://fontawesome.com/)

---


## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/photo_lab.git
cd photo_lab
```

### 2. Prerequisites

- **Flutter SDK**: `>=3.5.4`
- **Dart SDK**: Comes pre-packaged with Flutter.
- **Recommended IDE**: [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

Ensure Flutter is correctly installed by running:

```bash
flutter --version
```

### 3. Initial Project Setup

Navigate to the project directory and run:

```bash
flutter clean
flutter pub get
```

### 4. Install Dependencies

All necessary dependencies are listed in 

pubspec.yaml

. Install them using:

```bash
flutter pub get
```

### 5. Running the App

#### Android

- Ensure an Android emulator is running, or an Android device is connected.
- Run:

  ```bash
  flutter run
  ```

#### iOS

- Ensure Xcode is installed.
- Open the project in Xcode:

  ```bash
  open ios/Runner.xcworkspace
  ```

- Configure signing and capabilities.
- Run:

  ```bash
  flutter run
  ```

---

## Environment Setup and Configuration

### 1. Development Environment
- **IDE**: [Visual Studio Code](https://code.visualstudio.com/) with Flutter and Dart extensions.
- **Flutter Channel**: Stable (`flutter channel stable`).
- **Firebase Project**: Create a new project on the [Firebase Console](https://console.firebase.google.com/).

### 2. Configuration Files
- **`pubspec.yaml`**: Manages project dependencies.
- **`build.yaml`**: Configures code generation for the project.
- **`analysis_options.yaml`**: Static analysis configuration.
- **`flutterfire_config.sh`**: Script to configure Firebase for different environments.
- **`firebase_options.dart`**: Contains Firebase configuration for different environments.
- **`android/app/google-services.json`**: Firebase Android configuration file.
- **`ios/Runner/GoogleService-Info.plist`**: Firebase iOS configuration file.
- **`firestore.rules`**: Firestore security rules.
- **`firestore.indexes.json`**: Firestore indexes.
- **`storage.rules`**: Firebase Storage security rules.

### 3. Firebase Setup
- **Authentication**: Enable Email/Password and Google Sign-In methods.
- **Firestore**: Create a Cloud Firestore database and set up security rules.
- **Storage**: Create a Cloud Storage bucket and set up security rules.

## Key Technical Decisions

### 1. Architectural Approach

**Domain-Driven Design**: Organize the app into layers based on business logic and separation of concerns. The app follows a clean architecture with the following layers:

- **Presentation Layer**: UI components and widgets. 
- **Application Layer**: State management and application logic. 
- **Domain Layer**: Business logic and domain models. 
- **Infrastructure Layer**: Data access and external service integration. 

### 2. State Management Strategy

**Riverpod**: Used for state management due to its simplicity, type safety, and versatility.

- **Providers**: Manage state and expose it to the UI.
- **Hooks**: Utilize `flutter_hooks` for managing widget lifecycle.

### 3. Key Libraries and Packages

- **Firebase**: `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`.
- **State Management**: `flutter_riverpod`, `hooks_riverpod`.
- **Async Programming**: `fpdart`, `rxdart`.
- **Routing**: `go_router`.
- **Image Handling**: `image_picker`, `cached_network_image`
- **UI Components**: Custom [ui_kit](/ui_kit/) as a shared package for consistent design.
- **Localization**: App localization using `flutter_localizations` and `intl` as a shared package [localization](/localizations/) for consistent translations.

### 4. Design Patterns Implemented
Among the design patterns implemented in the app are:
- **Repository Pattern**: Abstract data access and provide a clean API. See [PhotoRepository](/lib/src/domain/photo/photo_repository.dart).
- **Factory Pattern**: Create objects without specifying the exact class. See [AppTheme](/ui_kit/lib/src/theme/app_theme.dart#L36)
- **Facade Pattern**: Simplify complex subsystems and provide a unified interface. See [PhotosService](/lib/src/application/photo/services//photos_service.dart).
- **Dependency Injection**: Leverage Riverpod providers for injecting dependencies.

### 5. Rationale Behind Major Technical Choices

- **Domain-Driven Design Architecture**: Ensures a clear separation of concerns and maintainability.
- **Riverpod**: Provides a robust and scalable state management solution without the boilerplate of some alternatives.
- **Custom UI Kit**: To ensure consistency across the app and facilitate reuse of components.

### 6. Project Structure Overview
The project follows a layer-based structure with separate directories for each layer, with further separation based on features and functionality.

```plaintext
lib/
├── main.dart
├── src/
│   ├── app.dart
│   ├── application/
│   │   ├── authentication/
│   │   ├── permission/
│   │   ├── photo/
│   │   ├── shared/
│   │   ├── upload/
│   │   ├── user/
│   │   ├── warmup/
│   ├── domain/
│   │   ├── authentication/
│   │   ├── permission/
│   │   ├── photo/
│   │   ├── shared/
│   │   ├── upload/
│   │   ├── user/
│   ├── infrastructure/
│   │   ├── authentication/
│   │   ├── permission/
│   │   ├── photo/
│   │   ├── shared/
│   │   ├── upload/
│   │   ├── user/
│   ├── presentation/
│   │   ├── authentication/
│   │   ├── photos/
│   │   ├── routing/
│   │   ├── settings/
│   │   ├── shared/
│   │   ├── splash/
│   │   ├── warmup/
│   ├── firebase_options_dev.dart
│   └── flavors.dart
localizations/
├── ...
ui_kit/
└── ...
```

### 7. Data Modelling and Storage Strategy
#### Firebase Services
- **Firestore**: NoSQL database for storing photo data and user information.
- **Storage**: Firebase Storage for storing user-uploaded photos.

#### Data Models
- **Photo**: Represents a photo with metadata.
- **User**: Represents a user with profile information.
- **Filter**: Represents a photo filter with a name and matrix.

---

## Feature Overview and Future Improvements
### Authentication
Handle user authentication using Firebase Authentication.
- <input disabled checked type="checkbox"> Google Sign-In
- <input disabled checked type="checkbox"> Sign-Out
- <input disabled type="checkbox"> Email/Password Sign-In
- <input disabled type="checkbox"> Sign-Up
- <input disabled type="checkbox"> Password Reset

### Permissions
Manage app permissions with a [PermissionService](/lib/src/application/permission/services/permission_service.dart) based on domain events.
- <input disabled checked type="checkbox"> Request Camera Permission
- <input disabled checked type="checkbox"> Request Storage Permission

### Photos
Display a list of photos from Firestore withwith various filters and effects. Original photos are stored in Firebase Storage, and filter data is stored in Firestore. Edited photos are saved to the device's gallery.
- <input disabled checked type="checkbox"> Display Photos
- <input disabled checked type="checkbox"> Upload Photos
- <input disabled checked type="checkbox"> Edit Photos with Color Filters matricies
- <input disabled checked type="checkbox"> Save Edited Photos
- <input disabled type="checkbox"> Delete Photos
- <input disabled type="checkbox"> Share Photos
- <input disabled type="checkbox"> OpenCV Integration for advanced editing
- <input disabled type="checkbox"> Neural Style Transfer for artistic effects

### User Profile
Manage user profile information.
- <input disabled checked type="checkbox"> Display User Profile
- <input disabled type="checkbox"> Update User Profile
- <input disabled type="checkbox"> Change Profile Picture
- <input disabled type="checkbox"> Update User Preferences
- <input disabled type="checkbox"> Delete User Account

### Routing
Handle navigation between screens using the [GoRouter](/lib/src/presentation/routing/routers/router.dart) package.

### Warmup
Preload data for a smooth user experience. See the [WarmupService](/lib/src/application/warmup/services/app_warmup_service.dart).

---

### Potential Performance Optimizations

- <input disabled type="checkbox"> **Lazy Loading**: Implement lazy loading for images to improve performance.
- <input disabled type="checkbox"> **Pagination**: Load photos in batches to reduce initial load times.

### Potential New Integrations or Features
- <input disabled type="checkbox"> **Firebase Cloud Functions**: Use Firebase Cloud Functions to ensure secure and efficient backend processing.
- <input disabled type="checkbox"> **Firebase Analytics**: Integrate Firebase Analytics to track user engagement.
- <input disabled type="checkbox"> **Sentry**: Implement error tracking with Sentry for better issue resolution.

