import 'package:flutter/material.dart';

class ChallengeWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget dropdownWidget;

  const ChallengeWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.dropdownWidget,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChallengeWidgetState createState() => _ChallengeWidgetState();
}

class _ChallengeWidgetState extends State<ChallengeWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 253, 123, 84),
                  ),
                  child: Icon(
                    widget.icon,
                    size: 70,
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Icon(
                      isExpanded
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      size: 50),
                )
              ],
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: widget.dropdownWidget,
          ),
        ],
      ),
    );
  }
}
