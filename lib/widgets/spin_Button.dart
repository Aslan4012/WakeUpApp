import 'package:flutter/material.dart';

class SpinButton extends StatefulWidget {
  final String title;
  final bool isVisible;
  final VoidCallback onStartSpinning;

  const SpinButton(
      {Key? key,
      required this.title,
      required this.onStartSpinning,
      this.isVisible = true})
      : super(key: key);

  @override
  _SpinButtonState createState() => _SpinButtonState();
}

class _SpinButtonState extends State<SpinButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isVisible
        ? GestureDetector(
            onTap: widget.onStartSpinning,
            child: Card(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              color: Color(0xffffffff),
              shadowColor: Color(0x4d939393),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
