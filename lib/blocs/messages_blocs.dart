import 'dart:async';
import 'package:condominios/repos/messages_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'messages_events.dart';
import 'messages_states.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final MessagesRepository _messagesRepository;

  MessagesBloc(this._messagesRepository) : super(MessagesInitial()) {
    on<AddPhoneNumber>(_onAddPhoneNumber);
    on<RemovePhoneNumber>(_onRemovePhoneNumber);
    on<CleanPhoneNumbers>(_onCleanPhoneNumbers);
  }

  List<String> _phoneNumbers = [];

  FutureOr<void> _onAddPhoneNumber(AddPhoneNumber event, Emitter<MessagesState> emit) async {
    print('adding this phone number: ${event.phoneNumber}');
    _phoneNumbers.add(event.phoneNumber);
    emit(PhoneNumbersUpdated(_phoneNumbers));
  }

  FutureOr<void> _onRemovePhoneNumber(RemovePhoneNumber event, Emitter<MessagesState> emit) async {
    print('removing this phone number: ${event.phoneNumber}');
    _phoneNumbers.remove(event.phoneNumber);
    emit(PhoneNumbersUpdated(_phoneNumbers));
  }

  FutureOr<void> _onCleanPhoneNumbers(CleanPhoneNumbers event, Emitter<MessagesState> emit) async {
    _phoneNumbers = [];
    emit(PhoneNumbersUpdated(_phoneNumbers));
  }
}
