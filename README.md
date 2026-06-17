# InteractiveViewer Widget

> A built-in Flutter widget that lets users pan, zoom, and rotate any child widget using touch gestures, note, no packages required.

---

## What This App Does

This demo app shows three real-world use cases of `InteractiveViewer`, each as its own screen. You navigate between them from a home menu:

| Screen | What it shows |
|---|---|
| Basic Zoom | Pinch-to-zoom and pan on a network image |
| Pan Grid | Pan and zoom around a 10×10 color grid (think: map or dashboard) |
| Controller | Programmatic zoom buttons + live scale readout using `TransformationController` |

---

## How to Run

1. Make sure Flutter is installed — [flutter.dev/docs/get-started](https://flutter.dev/docs/get-started/install)
2. Clone this repo:
   ```bash
   git clone https://github.com/b-sandrine/widget_presentation-
   cd widget_presentation-
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

> No extra packages needed. `InteractiveViewer` is part of Flutter's core library.

---

## The Three Properties Demonstrated

The assignment requires three widget properties to be named, shown with their default values, changed live, and explained. Here are the three covered in this demo:

---

### 1. `minScale` and `maxScale`
**Shown in:** Example 1 — Basic Zoom

These two properties control how far the user can zoom out and in.

- **Default:** `minScale: 0.8`, `maxScale: 2.5`
- **Used in demo:** `minScale: 0.5`, `maxScale: 4.0`
- **What changes on screen:** With `minScale: 0.5`, the image can be shrunk to half its size. With `maxScale: 4.0`, the user can zoom in to 4× the original — enough to see fine detail on any image.
- **Why a developer would adjust this:** You'd tighten the range for a UI element you don't want distorted, or open it up wide for something like a medical image or a map where the user needs to zoom far in.

---

### 2. `boundaryMargin`
**Shown in:** Example 2 — Pan Grid

Controls how far outside the visible screen the content can be dragged before it snaps back.

- **Default:** `EdgeInsets.zero` — content cannot be dragged outside the viewport at all
- **Used in demo:** `EdgeInsets.all(100)` — gives 100 logical pixels of breathing room on all sides
- **What changes on screen:** Without `boundaryMargin`, panning feels stiff and abrupt — the content hits an invisible wall at the screen edge. With it set to 100, the content travels smoothly past the edge before gently snapping back, which feels much more natural.
- **Why a developer would adjust this:** Essential for map-like or large-canvas experiences where you want the user to feel like they're freely exploring, not fighting with the screen boundary.

---

### 3. `transformationController`
**Shown in:** Example 3 — Controller

A `TransformationController` that gives the developer programmatic read and write access to the current pan/zoom/rotation state.

- **Default:** `null` — InteractiveViewer manages all transformation state internally and you have no access to it
- **Used in demo:** A `TransformationController` instance passed in, used to read the current scale live and to reset the view on button press
- **What changes on screen:** The app bar title updates in real time to show the current zoom level as you pinch. The Zoom In, Zoom Out, and Reset buttons drive the transformation from code — not from touch.
- **Why a developer would adjust this:** Any time you need to give the user a "Reset" button, animate to a specific zoom level, or save and restore the last zoom state when the user comes back to the screen.

---

## App Screenshot
<img width="243" height="317" alt="image" src="https://github.com/user-attachments/assets/71a4b0b0-bc27-4947-a225-84b827d429c4" />
<img width="242" height="268" alt="image" src="https://github.com/user-attachments/assets/28d30672-0b60-4482-b9e9-5a3d68618281" />
<img width="238" height="275" alt="image" src="https://github.com/user-attachments/assets/f4ae9871-bf17-4712-8e1b-508aec49d339" />


## Project Structure

```
lib/
├── main.dart                  # App entry point + HomeMenu with navigation
└── screens/
    ├── FormScreen.dart        # Original project screen
    ├── BasicZoomScreen.dart   # Example 1 — minScale / maxScale
    ├── PanGridScreen.dart     # Example 2 — boundaryMargin
    └── ControllerScreen.dart  # Example 3 — transformationController
