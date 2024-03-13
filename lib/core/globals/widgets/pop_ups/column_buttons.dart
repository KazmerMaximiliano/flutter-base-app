import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/styles/styles.dart';

class ColumnButtons extends StatelessWidget {
  const ColumnButtons({Key? key, required this.children}) : super(key: key);
  final List<ColumnButton> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children.allToWidget,
      ),
    );
  }
}

class ColumnButton {
  final Widget child;
  final void Function()? onPressed;

  ColumnButton({
    required this.child,
    this.onPressed,
  });

  Widget get toWidget => Builder(
        builder: (_) => Center(
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              style: Styles.buttons.base(
                color: Colors.white,
                innerPadding: const EdgeInsets.symmetric(vertical: 21.0),
              ),
              child: child,
              onPressed: onPressed,
            ),
          ),
        ),
      );
}

extension ColumnButtonListExt on List<ColumnButton> {
  List<Widget> get allToWidget {
    const _divider = Divider(
      color: Colors.grey,
      thickness: 0.125,
      height: 0.0,
    );
    List<Widget> widgets = [];
    for (ColumnButton cb in this) {
      widgets.add(cb.toWidget);
      if (cb != last) widgets.add(_divider);
    }
    return widgets;
  }
}
