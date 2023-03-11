import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ActivityEvent extends Equatable {
  const ActivityEvent();
}

class LoadActivityEvent extends ActivityEvent {
  @override
  List<Object?> get props => [];
}
