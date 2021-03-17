import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:sizer/sizer.dart';

showBottomSheetModal(
    {bool isBackgroundDarkened = false, BuildContext context, Widget widget}) {
  showModalBottomSheet<void>(
    context: context,
    barrierColor: isBackgroundDarkened ? Colors.black : Colors.transparent,
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

void showAsBottomSheet(
    {BuildContext context, double height, Widget widget}) async {
  final result = await showSlidingBottomSheet(context, builder: (context) {
    return SlidingSheetDialog(
      elevation: 8,
      cornerRadius: 16,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.4, 0.7, 1.0],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return Material(
          color: Theme.of(context).cardColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 3,
                  width: 20,
                  child: Container(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Container(height: height, child: Center(child: widget)),
            ],
          ),
        );
      },
    );
  });

  print(result); // This is the result.
}
