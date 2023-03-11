import 'package:condominios/blocs/activity_blocs.dart';
import 'package:condominios/blocs/activity_events.dart';
import 'package:condominios/blocs/activity_states.dart';
import 'package:condominios/helpers/sizes.dart';
import 'package:condominios/models/activity_model.dart';
import 'package:condominios/repos/activities_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  Widget blocBody() {
    return BlocProvider(
        create: (context) => ActivityBloc(
              ActivitiesRepository(),
            )..add(LoadActivityEvent()),
        child: BlocBuilder<ActivityBloc, ActivityState>(
          builder: (context, state) {
            if (state is ActivityLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ActivityLoadedState) {
              List<ActivityModel> activityList = state.activities;
              return SafeArea(
                child: ListView.builder(
                    itemCount: activityList.length,
                    itemBuilder: (_, index) {
                      ActivityModel activity = activityList[index];
                      return activityList.isEmpty
                          ? const Center(
                              child: Text('No hay datos'),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Para: ${activity.deliverFrom}"),
                                    Text(
                                        "Expiration Date: ${activity.expirationDate}"),
                                    Text(
                                        "Remaining Uses: ${activity.remainingUses}"),
                                    Text(
                                        "Service Type: ${activity.serviceType}"),
                                    Text(
                                        "Validated: ${activity.validated != null ? "Yes" : "No"}"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Aceptar"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              28.0, 0, 0, 0),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text(
                                                "Esperar 15 minutes"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }),
              );
            }
            if (state is ActivityErrorState) {
              return Center(
                child: Text("Error ${state.error}"),
              );
            }

            return Container();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Sizes.initSizes(size.height, size.width);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: blocBody(),
    );
  }
}
