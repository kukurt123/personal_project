import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// Future<void> ModalSheet(BuildContext context, List<String> array, VoidCallback callback) async {
//   showPlatformModalSheet(
//       context: context,
//       builder: (_) => PlatformWidget(
//         material: (_, __)  => _materialPopupContent(),
//         cupertino: (_, __) => _cupertinoSheetContent(),
//       ),
//     );
// }

//  _showPicker(BuildContext ctx) {
//     showCupertinoModalPopup(
//         context: ctx,
//         builder: (_) => Container(
//               width: 300,
//               height: 250,
//               child: CupertinoPicker(
//                 backgroundColor: Colors.white,
//                 itemExtent: 30,
//                 scrollController: FixedExtentScrollController(initialItem: 1),
//                 children: [
//                   Text('0'),
//                   Text('1'),
//                   Text('2'),
//                 ],
//                 onSelectedItemChanged: (value) {
//                   setState(() {
//                     _selectedValue = value;
//                   });
//                 },
//               ),
//             ));
//   }
