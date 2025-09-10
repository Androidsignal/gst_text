
[![DashStackPoster](https://github.com/user-attachments/assets/7c89bfb5-a1d9-496b-ac68-b9737f34fc5b)](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8?pvs=143)

# Gst Text

A customizable Flutter widget to calculate and display GST (Goods & Services Tax) with flexible UI options.

Flutter GST Text Widget – Easily calculate and display GST, total amount, and tax breakdown in your Flutter apps. Supports CGST, SGST, IGST, custom percentages, and formatted currency display.

---

## ✨ Features

- ✅ Supports **IGST, CGST, SGST, UTGST**
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

## 📸 Screenshots
| withoutAnyCustomization DefultScreen| with customization Screen |
|-------------------|-----------------------------|
| ![no customization](https://github.com/user-attachments/assets/a7a4df6a-ba72-4468-b21a-6df31140324a) |  ![all customization](https://github.com/user-attachments/assets/7fe450fa-25ad-427d-ac69-4caaa95c01a6)|

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
| Property             | Type                  | Default      | Description                                                                                                                                          |
| -------------------- | --------------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `amount`             | `num`                 | **Required** | The base amount before GST is applied.                                                                                                               |
| `gstType`            | `GstType`             | **Required** | GST type – one of `igst`, `cgst`, `sgst`, `utgst`.                                                                                                   |
| `gstPercentage`      | `num?`                | `null`       | Extra percentage (added on top of default GST). Example: `gstPercentage: 10` → if `cgst` default is 9%, final applied is `19%`.                      |
| `currencySymbol`     | `String`              | `₹`          | Currency symbol used for formatting. Change to `"$"` or `"€"` if needed.                                                                             |
| `avoidFormatting`    | `bool`                | `false`      | If `true`, skips `intl` formatting → raw decimal like `1000.00` instead of `₹1,000.00`.                                                              |
| `hideCurrencySymbol` | `bool`                | `false`      | If `true`, hides the currency symbol completely. Example: `1000.00` instead of `₹1000.00`.                                                           |
| `showOnlyTotal`      | `bool`                | `false`      | If `true`, displays only the total (no amount/GST breakdown).                                                                                        |
| `showGstType`        | `bool`                | `false`      | If `true`, displays GST type (e.g., `GST [CGST]`).                                                                                                   |
| `showGstPercentage`  | `bool`                | `false`      | If `true`, displays GST percentage (e.g., `GST (18%)`).                                                                                              |
| `gstValueCallBack`   | `Function(GstModel)?` | `null`       | Callback that returns the full `GstModel` object (amount, gstAmount, total, gstPercentage, gstType). Useful for saving or further processing values. |

### without any customization
```
 GstText(
   amount: 1000, // amount
   gstType: GstType.cgst, // gst type
 )
```
![no customization](https://github.com/user-attachments/assets/a7a4df6a-ba72-4468-b21a-6df31140324a)


### with all customization
```
 GstText(
   amount: 1000, // amount
   gstType: GstType.cgst, // gst type
   gstPercentage: 21, // optional additional percentage
   avoidFormatting: false, // set true to avoid formatting
   showOnlyTotal: false, // set true to show only total amount
   showGstPercentage: true, // set true to show gst percentage
   hideCurrencySymbol: true, // set true to hide currency symbol
   showGstType: true, // set true to show gst type
   /// Callback to get calculated values
   gstValueCallBack: (gstAmount) {
     print('GST Calculation: ${gstAmount.toJson()}');
     print('Amount: ${gstAmount.amount}');
     print('GST Amount: ${gstAmount.gstAmount}');
     print('Total: ${gstAmount.total}');
     print('Percentage: ${gstAmount.gstPercentage}');
     print('GST Type: ${gstAmount.gstType}');
   },
),

```
![all customization](https://github.com/user-attachments/assets/7fe450fa-25ad-427d-ac69-4caaa95c01a6)

### logic Only using for method

```
final gstValues = GstModel.calculate(
   amount: 2000, // amount
   gstType: GstType.cgst, // gst type
   gstPercentage: 20, // optional additional percentage  
);
```

# Bugs and Feedback 
We welcome and appreciate any suggestions you may have for improvement.
For bugs, questions, and discussions please use the [GitHub Issues](https://github.com/Androidsignal/gst_text/issues).

# Acknowledgments 
It extends Flutter’s foundation to provide a ready-to-use, customizable currency formatter widget.While Flutter and intl provide the base, price_text simplifies the process by combining widgets and formatting logic into a single package you can drop into any app.
 
# Contribution 
The DashStack team enthusiastically welcomes contributions and project participation!
There are a bunch of things you can do if you want to contribute!
The Contributor Guide has all the information you need for everything from reporting bugs to contributing new features.
  
# Credits 
`gst_text` is owned and maintained by the `Dashstack team`.
Follow us for updates and new releases 🚀.

