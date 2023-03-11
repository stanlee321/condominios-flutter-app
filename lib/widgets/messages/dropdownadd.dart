import 'package:flutter/material.dart';

class DropdownWithAddAndRemove extends StatefulWidget {
  @override
  _DropdownWithAddAndRemoveState createState() =>
      _DropdownWithAddAndRemoveState();
}

class _DropdownWithAddAndRemoveState extends State<DropdownWithAddAndRemove> {
  List<String> _dropdownItems = ["Item 1", "Item 2", "Item 3"];
  String? _selectedItem;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: (_dropdownItems.isNotEmpty)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _dropdownItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_dropdownItems[index]),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                if (_dropdownItems.isNotEmpty) {
                                  setState(() {
                                    _dropdownItems.removeAt(index);
                                    if (_selectedItem ==
                                        _dropdownItems[index]) {
                                      _selectedItem = null;
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Text('Add reference phone numbers'),
        ),
        // PopupMenuButton<String>(
        //   itemBuilder: (BuildContext context) {
        //     return _dropdownItems.map((String item) {
        //       return PopupMenuItem<String>(
        //         value: item,
        //         child: Text(item),
        //       );
        //     }).toList();
        //   },
        //   onSelected: (String? value) {
        //     setState(() {
        //       _selectedItem = value;
        //     });
        //   },
        //   initialValue: _selectedItem,
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: Text(_selectedItem ?? "Select an item"),
        //       ),
        //       Icon(Icons.arrow_drop_down),
        //     ],
        //   ),
        // ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: "Add new item",
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _dropdownItems.add(_textEditingController.text);
                  _selectedItem = _textEditingController.text;
                  _textEditingController.clear();
                });
              },
              child: Text("Add"),
            ),
          ],
        ),
      ],
    );
  }
}
