import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/palette.dart';

class ComTextForm extends StatefulWidget {
  const ComTextForm({
    super.key,
    required this.valitext,
    required this.prefixIcon,
    required this.hintText,
    required this.keyboard,
    required this.subject,
    required this.suffixIcon,
    required this.focusColor,
    required this.onSaved,
  });

  final String valitext;
  final String hintText;
  final Icon prefixIcon;
  final TextInputType keyboard;
  final String subject;
  final Icon suffixIcon;
  final Color focusColor;
  final FormFieldSetter onSaved;

  @override
  _ComTextFormState createState() => _ComTextFormState();
}

class _ComTextFormState extends State<ComTextForm> {
  final TextEditingController _controller = TextEditingController();
  bool _isClearButtonVisible = false;
  final _focusNode = FocusNode();
  bool _isFocused = false;




  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isClearButtonVisible = _controller.text.isNotEmpty;
      });
    });
    _focusNode.addListener(() {setState(() { _isFocused = _focusNode.hasFocus;});});

  }

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.subject,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Palette.textColor1,
            ),
          ),
        ),
        SizedBox(
          height: mHeight * 0.02,
        ),
        SizedBox(
          height: mHeight * 0.08,
          child: TextFormField(
            key: Key('1'),
            validator: (value) {
              if (value!.isEmpty) {
                return widget.valitext;
              }
              return null;
            },
            keyboardType: widget.keyboard,
            textInputAction: TextInputAction.next,
            controller: _controller,
            onSaved: (value) => onSaved,
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: _isClearButtonVisible
                  ? IconButton(
                icon: widget.suffixIcon,
                onPressed: () {
                  _controller.clear();
                },
              )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor2),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
