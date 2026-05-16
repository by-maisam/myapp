# 🍗 Fast Food Commerce App

A sleek, responsive, and cross-platform food ordering interface built with Flutter. The application showcases advanced layout paradigms including custom staggered grids, carousels, horizontal scroll lists, and dynamic UI banners.

---

## 📱 Features & Highlights

*   **Dynamic Banner Slider:** High-performance promotional carousel featuring smooth animations, custom aspect ratios, and auto-play configurations.
*   **Staggered Layout Exploration:** A multi-span category section powered by `flutter_staggered_grid_view` to highlight seasonal features alongside traditional menu groups.
*   **Enhanced Product Visualization:** Custom product horizontal lists equipped with brand identifier tags, pricing cards, and bounding containment to restrict text or overflow issues.
*   **Elevated Floating Cart Callouts:** Proportional, shadow-lifted custom action components featuring inline icons to elevate micro-interactions.
*   **Responsive Multi-Device Support:** Optimized completely to deploy flawlessly onto mobile environments as well as Flutter Web engines running directly inside Chrome.

---

## 🛠️ Tech Stack & Architecture

*   **Framework:** [Flutter](https://flutter.dev/) (Channel Stable)
*   **Language:** Dart 3.x
*   **Key Dependencies:**
    *   `carousel_slider` — For fluent promotional header galleries.
    *   `flutter_staggered_grid_view` — For flexible category indexing grids.
    *   `dotted_border` — Providing dashed asset boundaries for modern grid design aesthetics.

### 📂 Directory Architecture
```text
lib/
├── pages/        # View screens (MainPage, MenuPage, etc.)
├── widgets/      # Isolated components (BrandUnderline, etc.)
├── utils/        # Global style constants
│   ├── colors.dart      # Branding palettes
│   ├── dimensions.dart  # Margin, padding, and layout scale vectors
│   ├── spacing.dart     # Consistent spacer blocks
│   └── data.dart        # Mock product matrix map models
└── main.dart     # Application bootstrap entry
