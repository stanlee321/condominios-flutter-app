import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class MessageInputField extends StatefulWidget {
  @override
  _MessageInputFieldState createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController _messageController = TextEditingController();
  int _maxLength = 280;
  final ValueNotifier<String> _messageTextLengthNotifier = ValueNotifier<String>('0');

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    _messageTextLengthNotifier.value = _messageController.text.length.toString();
  }

  @override
  void dispose() {
    _messageController.removeListener(_onTextChanged);
    _messageController.dispose();
    _messageTextLengthNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _messageController,
          maxLength: _maxLength,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            labelText: 'Write your message',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _messageTextLengthNotifier,
          builder: (BuildContext context, String value, Widget? child) {
            return Container();//Text('$value/$_maxLength');
          },
        ),
      ],
    );
  }
}
