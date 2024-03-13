import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/globals.dart';

class SmartzoneDropDown extends StatefulWidget {
  const SmartzoneDropDown({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.item,
    this.iconPadding = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.withUnderline = false,
  }) : super(key: key);
  final void Function(String?)? onChanged;
  final String value;
  final List<String> items;
  final DropdownMenuItem<String> Function(String) item;
  final EdgeInsetsGeometry iconPadding;
  final EdgeInsetsGeometry padding;
  final bool withUnderline;
  @override
  State<SmartzoneDropDown> createState() => _SmartzoneDropDownState();
}

class _SmartzoneDropDownState extends State<SmartzoneDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: widget.padding,
      child: DropdownButton<String>(
        value: widget.value,
        icon: Padding(
          padding: widget.iconPadding,
          child: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: SzColors.greys.greyc2,
          ),
        ),
        style: Styles.texts.inLogin.input,
        isExpanded: true,
        underline: !widget.withUnderline ? const SizedBox() : null,
        elevation: 1,
        dropdownColor: Colors.white,
        itemHeight: 55,
        items: widget.items.map(widget.item).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
