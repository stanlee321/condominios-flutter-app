import 'package:equatable/equatable.dart';

abstract class MessagesState extends Equatable {
  const MessagesState();
}

class MessagesInitial extends MessagesState {
  @override
  List<Object> get props => [];
}

class PhoneNumbersUpdated extends MessagesState {
  final List<String> phoneNumbers;

  const PhoneNumbersUpdated(this.phoneNumbers);

  @override
  List<Object> get props => [phoneNumbers];
}
