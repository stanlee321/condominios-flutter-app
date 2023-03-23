import 'package:equatable/equatable.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();
}

class AddPhoneNumber extends MessagesEvent {
  final String phoneNumber;

  const AddPhoneNumber(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class RemovePhoneNumber extends MessagesEvent {
  final String phoneNumber;

  const RemovePhoneNumber(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class CleanPhoneNumbers extends MessagesEvent {
  @override
  List<Object> get props => [];
}
