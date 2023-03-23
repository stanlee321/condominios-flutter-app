import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:condominios/blocs/messages_blocs.dart';
import 'package:condominios/blocs/messages_states.dart';

class EnviarButton extends StatelessWidget {
  final VoidCallback onPressed;

  EnviarButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        if (state is PhoneNumbersUpdated && state.phoneNumbers.isNotEmpty) {
          return ElevatedButton(
            onPressed: onPressed,
            child: Text('Enviar'),
          );
        }
        return SizedBox.shrink(); // Return an empty widget when the button should not be visible.
      },
    );
  }
}
