import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = 'Tilføj noget';

  List<String> getItems() {
    List<String> items = ["Tilføj noget", "Noget andet"];
    items.remove(dropdownValue);
    items.insert(0, dropdownValue);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Container(
        width: 130,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            dropdownColor: Colors.orangeAccent,
            value: dropdownValue,
            items: getItems().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(child: Text(value)),
              );
            }).toList(),
            style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropdownValue = newValue;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
