# Changelog

All notable changes to the **gst_text** package will be documented in this file.  
This project follows [Semantic Versioning](https://semver.org/).

---

## [0.0.3] - (2025-Sep-15)

- Update documentation in README.md with better usage examples.

## [0.0.2] - (2025-sep-11)

Introduced **`gstMode`** property:
- Supports `inclusive`, `exclusive`, or default `GST`.
- `inclusive`: Amount includes GST.
- `exclusive`: GST added on top of the amount.
- Fixed minor when hiding/showing properties.


## [0.0.1] - (2025-Sep-10)

- Initial release of `gst_text` package.
- `GstText` widget for displaying GST amount, GST type, and total in Flutter apps.
- Supports customization: show/hide GST percentage, type, total, and currency symbol.
- `GstModel` class with static `calculate` method for programmatic GST calculation.
- Callback support to retrieve calculated GST values for further processing.
- Ready-to-use, reusable widget that can be easily integrated into Flutter screens.
