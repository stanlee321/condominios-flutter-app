import 'package:condominios/blocs/messages_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:condominios/blocs/messages_blocs.dart';
import 'package:condominios/blocs/messages_events.dart';

class DropdownWithAddAndRemove extends StatefulWidget {
  @override
  _DropdownWithAddAndRemoveState createState() =>
      _DropdownWithAddAndRemoveState();
}

class _DropdownWithAddAndRemoveState extends State<DropdownWithAddAndRemove> {
  String? _selectedItem;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MessagesBloc, MessagesState>(
          builder: (context, state) {
            if (state is PhoneNumbersUpdated) {
              return state.phoneNumbers.isNotEmpty
                  ? Wrap(
                      spacing: 8.0, // Space between items
                      runSpacing: 8.0, // Space between rows
                      children: state.phoneNumbers
                          .map(
                            (phoneNumber) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(phoneNumber,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),),
                                    IconButton(
                                      icon: Icon(Icons.remove_circle),
                                      onPressed: () {
                                        context.read<MessagesBloc>().add(
                                            RemovePhoneNumber(phoneNumber));
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : Text('Add reference phone numbers');
            }
            return Container();
          },
        ),
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
                context.read<MessagesBloc>().add(
                    AddPhoneNumber(_textEditingController.text));
                _textEditingController.clear();
                setState(() {});
              },
              child: Text("Add"),
            ),
          ],
        ),
      ],
    );
  }
}
