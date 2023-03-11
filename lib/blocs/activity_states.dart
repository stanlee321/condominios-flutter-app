import 'package:condominios/models/activity_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ActivityState extends Equatable {}

class ActivityLoadingState extends ActivityState {
  @override
  List<Object?> get props => [];
}

class ActivityLoadedState extends ActivityState {
  final List<ActivityModel> activities;
  ActivityLoadedState(this.activities);
  @override
  List<Object?> get props => [activities];
}

class ActivityErrorState extends ActivityState {
  final String error;
  ActivityErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
