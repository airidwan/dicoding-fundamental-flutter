import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatefulWidget {
  final String? text;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClearText;
  final EdgeInsetsGeometry? margin;
  final TextInputAction? textInputAction;
  final bool? enable;
  final bool? autofocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  const SearchInputWidget({
    Key? key,
    this.text,
    this.onChanged,
    this.onSubmitted,
    this.onClearText,
    this.margin,
    this.textInputAction,
    this.enable,
    this.autofocus,
    this.focusNode,
    this.controller,
  }) : super(key: key);

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  late TextEditingController controller;
  bool showClearIcon = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: 35),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) {
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {
              showClearIcon = controller.text.isNotEmpty;
            });
            if (widget.onSubmitted != null) widget.onSubmitted!(controller.text);
          },
          onChanged: (value) {
            setState(() {
              showClearIcon = controller.text.isNotEmpty;
            });
            if (widget.onChanged != null) widget.onChanged!(controller.text);
          },
          decoration: InputDecoration(
              hintText: 'Pencarian',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.all(8),
              suffixIcon: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2),
                child: CupertinoButton(
                  onPressed: () {
                    if (showClearIcon) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final bool textChanged = controller.text.isNotEmpty;
                      controller.clear();
                      setState(() {
                        showClearIcon = false;
                      });
                      if (widget.onClearText != null && textChanged) widget.onClearText?.call();
                      if (widget.onChanged != null && textChanged) widget.onChanged!(controller.text);
                    }
                  },
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Icon(
                    showClearIcon ? CupertinoIcons.xmark_circle_fill : Icons.search,
                    color: Colors.grey,
                  ),
                ),
              )),
        ),
      ),
    );
  }


}
