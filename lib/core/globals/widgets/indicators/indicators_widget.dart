import 'package:flutter/material.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({Key? key, required this.index, required this.length})
      : super(key: key);
  final int index;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: length > 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          length,
          (i) => Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0),
            child: Container(
              height: 3.5,
              width: (MediaQuery.of(context).size.width * .6) / length,
              decoration: BoxDecoration(
                color: index == i ? const Color(0xFFFF4D67) : const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
