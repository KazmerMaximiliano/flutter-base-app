import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/widgets/smartzone_icons.dart';

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SzColors.greys.greyc2,
      ),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SzIcon(SzIcons.delete, color: Colors.white),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SzIcon(SzIcons.delete, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
