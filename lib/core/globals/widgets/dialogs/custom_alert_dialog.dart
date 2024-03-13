import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

void customAlertDialog(BuildContext context, List<Widget> widgets) {
  showDialog(
    context: context,
    builder: (BuildContext context) => _CustomAlertDialog(
      widgets: widgets,
    ),
  );
}

class _CustomAlertDialog extends StatelessWidget {
  const _CustomAlertDialog({Key? key, required this.widgets}) : super(key: key);
  final List<Widget> widgets;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: SzColors.pasteles.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widgets,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
