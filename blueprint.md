# Screensaver Clock App Blueprint

## Overview

A simple and elegant screensaver clock application for Flutter. It displays the current time in a large, resizable digital format on a black background. The app includes a settings page to customize the clock's appearance and a fullscreen mode for an immersive experience.

## Style, Design, and Features

### Initial Version (v1.0)

*   **Theme:** Dark theme with a black background (`Colors.black`).
*   **Clock Display:**
    *   Displays the current time (HH:mm:ss).
    *   The time is centered on the screen.
    *   The font size of the clock is adjustable.
*   **Main Screen:**
    *   An `AppBar` with the title "Screensaver Clock".
    *   An `IconButton` to toggle fullscreen mode.
    *   An `IconButton` to navigate to the settings screen.
*   **Settings Screen:**
    *   A `Slider` to control the font size of the clock text.
*   **Navigation:** Basic `Navigator` for moving between the main screen and the settings screen.
*   **State Management:** `ValueNotifier` to manage the font size.

## Current Plan

### Implement the Screensaver Clock App

1.  **Create `blueprint.md`:** Document the plan and features. (Done)
2.  **Add `intl` package:** For date and time formatting.
3.  **Create `lib/settings_screen.dart`:** Build the settings screen with a slider for font size adjustment.
4.  **Update `lib/main.dart`:**
    *   Set up the main application structure with a dark theme.
    *   Create the home screen with the digital clock and app bar.
    *   Implement the time display and update logic.
    *   Implement navigation to the settings screen.
    *   Implement the fullscreen functionality.
    *   Connect the font size setting to the clock text.
5.  **Update `test/widget_test.dart`:** Write a simple test to verify that the clock screen is rendered.
