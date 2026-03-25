# 📱 Taskati - Changelog

## 🚀 Version 0.1.0 — Initial Release

### 🆕 Features

* Built the first version of Taskati
* Added Splash screen with animation
* Implemented user setup (choose image + enter name)
* Saved user data using SharedPreferences
* Created Home screen UI
* Integrated Hive for local storage
* Added basic task features (Add / View tasks)

---

## 🔧 Version 0.1.1 — Bug Fix

### 🐛 Fixes

* Fixed issue where user had to re-enter name and image every time the app starts
* Improved app flow to skip setup screen if data already exists

---

## 🚀 Version 0.2.0 — UI & Architecture Upgrade

### ✨ Improvements

* Refactored color system for a cleaner and more consistent UI
* Improved Add Task screen layout and text
* Enhanced button styling and input fields
* Improved overall user experience (UX)

### 🧠 State Management

* Implemented Bloc (Cubit) in Home screen
* Added AppCubit and AppState classes
* Separated business logic from UI

### ⚙️ Other Updates

* Updated project dependencies (flutter_bloc)
