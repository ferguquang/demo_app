// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// class DateRangeWidget extends StatefulWidget {
//   const DateRangeWidget({Key key}) : super(key: key);
//
//   static void showDateRangeWidget(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return DateRangeWidget();
//       }
//     );
//   }
//
//   @override
//   State<DateRangeWidget> createState() => _DateRangeWidgetState();
// }
//
// class _DateRangeWidgetState extends State<DateRangeWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         color: Colors.white,
//         height: 500,
//         child: SfDateRangePicker(
//           selectionMode: DateRangePickerSelectionMode.range,
//           onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
//             PickerDateRange dateRange = args.value;
//             print("date: ${args.value}");
//           },
//         ),
//       ),
//     );
//   }
// }
