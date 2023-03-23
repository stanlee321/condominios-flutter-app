import 'package:condominios/blocs/messages_blocs.dart';
import 'package:condominios/blocs/messages_events.dart';
import 'package:condominios/blocs/messages_states.dart';
import 'package:condominios/widgets/messages/dropdownadd.dart';
import 'package:condominios/widgets/messages/enviar_button.dart';
import 'package:condominios/widgets/messages/message_input.dart';
import 'package:condominios/widgets/messages/success_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool _isLoading = false;
  bool _showSuccess = false;


  Future<void> _onEnviarPressed() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 5));

    setState(() {
      _isLoading = false;
      _showSuccess = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _showSuccess = false;
    });
  }

  Widget blocBody() {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        if (state is PhoneNumbersUpdated) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.phoneNumbers.map((phoneNumber) {
              return Dismissible(
                key: Key(phoneNumber),
                onDismissed: (direction) {
                  context.read<MessagesBloc>().add(RemovePhoneNumber(phoneNumber));
                },
                child: ListTile(
                  title: Text(phoneNumber),
                ),
              );
            }).toList(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Center(
        child: Stack(
          children: [
            ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    // Text('Para',
                    //     style: TextStyle(
                    //       // color: Colors.blue,
                    //       // fontWeight: FontWeight.bold,
                    //       fontSize: 20,
                    //     )
                    // ),
                    Text('Casa 34', style: TextStyle(
                      // color: Colors.blue, 
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                      )),
                  ],
                ),
              ),
              Container(
                // add padding
                padding: const EdgeInsets.all(20),
                // height: 200,
                // width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Adjuntar Mensaje a: '),
                    const SizedBox(width: 20),
                    DropdownWithAddAndRemove(),
                    const SizedBox(height: 20),
                    MessageInputField(),
                    const SizedBox(height: 20),
                    // EnviarButton(onPressed: () {
                    //   // context.read<MessagesBloc>().add(SendMessage());
                    // }),
                    !_isLoading?EnviarButton(
                      onPressed: _onEnviarPressed,
                    ): const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],)
              ),
              // Text('Whatsapp a quienes enviar una solicitud'),
            ],
          ),
          // if (_isLoading)
          //     const Center(
          //       child: CircularProgressIndicator(),
          //     ),
            if (_showSuccess)
              SuccessMessage(),
          ],
        ),
        
      ),
    );
  }
}
