
[![DashStackPoster](https://github.com/user-attachments/assets/7c89bfb5-a1d9-496b-ac68-b9737f34fc5b)](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8?pvs=143)

# Gst Text

A customizable Flutter widget to calculate and display GST (Goods & Services Tax) with flexible UI options.

Flutter GST Text Widget – Easily calculate and display GST, total amount, and tax breakdown in your Flutter apps. Supports merit(5%),standard(18%),demerit(40%), custom percentages, and formatted currency display.

---

## ✨ Features

- ✅ Supports **merit(5%),standard(18%),demerit(40%)**
- ✅ GST mode – `inclusive` (amount already includes GST) or `exclusive` (GST added on top).     
- ✅ Default GST percentages included.
- ✅ Override GST percentage (e.g., add cess or custom rate).
- ✅ Show **Amount, GST, and Total**
- ✅ Option to show **only total**
- ✅ Show **GST type** and/or **percentage**
- ✅ Hide currency symbol if needed
- ✅ Built-in **currency formatting** with `intl` & avaoidformatting if needed.
- ✅ Callback (`gstValueCallBack`) to get full GST values as a model.
- ✅ Pure calculation support using `GstModel`.
  
---

| withoutAnyCustomization DefultScreen| with customization Screen |
|-------------------|-----------------------------|
| ![no customization](https://github.com/user-attachments/assets/338aa7c7-58c7-4d60-9ca3-c96c23e12726) | ![no customization](https://github.com/user-attachments/assets/5ed96b36-6957-4fc4-a7f8-1db4554be4a3)|

---

## How to use it ?

### 1. Add dependency
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  gst_text: <latest_version>
```  

### 2. Install it You can install packages from the command line: 

with pub :
```
$ pub get
```
with Flutter : 
```
$ flutter pub get
```
### 3. Import it

Now in your `Dart` code, you can use :

```
import 'package:gst_text/gst_text.dart';
```

### 4. Use it

[Sample app](https://github.com/Androidsignal/gst_text) demonstrates how simple the usage of the library actually is.

Using PriceText in your project is super simple.

You just need to add the widget with an amount and currency type, and it will handle formatting for you.

### 🎨 Customization Options
| Property | Type | Default | Description |
| -------------------- | --------------------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `amount` | `num` | **Required** | The base amount before GST is applied. |
| `gstType` | `GstType` | **Required** | GST type – one of `merit(5%)`, `standard(18%)`, `demerit(40%)`. |
| `gstMode` | `GstMode` | **Required** | GST mode – `inclusive` (amount already includes GST) or `exclusive` (GST added on top). |
| `gstPercentage` | `num?` | `null` | Extra percentage (added on top of default GST). Example: `gstPercentage: 10` → if `standard` default is 18%, final applied is `28%`. |
| `currencySymbol` | `String` | `₹` | Currency symbol used for formatting. Change to `"$"` or `"€"` if needed. |
| `avoidFormatting` | `bool` | `false` | If `true`, skips `intl` formatting → raw decimal like `1000.00` instead of `₹1,000.00`. |
| `hideCurrencySymbol` | `bool` | `false` | If `true`, hides the currency symbol completely. Example: `1000.00` instead of `₹1000.00`. |
| `showOnlyTotal` | `bool` | `false` | If `true`, displays only the total (no amount/GST breakdown). |
| `showGstAmount` | `bool` | `false` | If `true`, displays GST amount (e.g., `₹180.00`). |
| `showGstType` | `bool` | `false` | If `true`, displays GST type (e.g., `[Standard]`). |
| `showGstPercentage` | `bool` | `false` | If `true`, displays GST percentage (e.g., `(18%)`). |
| `showGstMode` | `bool` | `false` | If `true`, displays GST mode label (`Inclusive GST` / `Exclusive GST` / `GST`). |
| `gstValueCallBack` | `Function(GstModel)?` | `null` | Callback that returns the full `GstModel` object (amount, gstAmount, total, gstPercentage, gstType). Useful for saving or further processing. |

### without any customization :
---
Only Amount and Total will be shown by default.

GST amount, type, percentage, and mode are all hidden unless explicitly enabled.

Uses default GST percentage for the selected type .

exclusive mode →GST is added on top of amount.

inclusive mode → Amount already includes GST.

```
 GstText(
   amount: 1000, // amount
   gstType: GstType.standard, // gst type (merit(5%)/standard(18%)/demerit(40%))
   gstMode: GstMode.exclusive. // gst mode (inclusive/exclusive)
 )
```

| exclusive GstMode | inclusive GstMode  |
|-------------------|-----------------------------|
| ![no customization](https://github.com/user-attachments/assets/3f415ac8-b715-42f1-90e5-4778edcb2aef) | ![no customization](https://github.com/user-attachments/assets/36336e6e-e7bb-40e9-9d48-c284c5dfd373)|


### with all customization
---

```
GstText(
  amount: 2000, // amount
  gstMode: GstMode.exclusive, // gst mode (inclusive/exclusive)
  gstType: GstType.demerit, // gst type (merit(5%)/standard(18%)/demerit(40%))
  gstPercentage: 20, // optional additional percentage
  showGstType: true, // show gst type
  showGstPercentage: true, // show gst percentage
  showGstMode: true, // show gst mode
  showGstAmount: true, // show gst amount
  /// Callback to get calculated values
  gstValueCallBack: (gstAmount) {
    print('gstValues from widget: ${gstAmount.toJson()}');
    print('Amount: ${gstAmount.amount}');
    print('GST Amount: ${gstAmount.gstAmount}');
    print('Total: ${gstAmount.total}');
    print('Percentage: ${gstAmount.gstPercentage}');
    print('GST Type: ${gstAmount.gstType}');
  },
),

```

| inclusive GstMode| exclusive GstMode |
|-------------------|-----------------------------|
| ![all customization](https://github.com/user-attachments/assets/56e13a49-bb26-4990-8517-4f40b8613f15) | ![all customization](https://github.com/user-attachments/assets/c301a071-7785-47e2-bd83-c59e96552136) |


### logic Only using for method

```
final gstValues = GstModel.calculate(
   amount: 2000, // amount
   gstType: GstType.demerit, // gst type (merit(5%)/standard(18%)/demerit(40%))
   gstPercentage: 20, // optional additional percentage  
);
```

# Bugs and Feedback 
We welcome and appreciate any suggestions you may have for improvement.
For bugs, questions, and discussions please use the [GitHub Issues](https://github.com/Androidsignal/gst_text/issues).

# Acknowledgments 
It extends Flutter’s foundation to provide a ready-to-use, customizable currency formatter widget.While Flutter and intl provide the base, gst_text simplifies the process by combining widgets and formatting logic into a single package you can drop into any app.
 
# Contribution 
The DashStack team enthusiastically welcomes contributions and project participation!
There are a bunch of things you can do if you want to contribute!
The Contributor Guide has all the information you need for everything from reporting bugs to contributing new features.
  
# Credits 
`gst_text` is owned and maintained by the `Dashstack team`.
Follow us for updates and new releases 🚀.

