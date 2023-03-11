import 'package:condominios/blocs/activity_events.dart';
import 'package:condominios/blocs/activity_states.dart';
import 'package:condominios/blocs/app_states.dart';
import 'package:condominios/models/activity_model.dart';
import 'package:condominios/repos/activities_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivitiesRepository _activityRepository;

  ActivityBloc(this._activityRepository) : super(ActivityLoadingState()) {
    on<LoadActivityEvent>((event, emit) async {
      emit(ActivityLoadingState());
      try {
        final activities = await _activityRepository.getActivities();
        emit(ActivityLoadedState(activities));
      } catch (e) {
        emit(ActivityErrorState(e.toString()));
      }
    });
  }
}
