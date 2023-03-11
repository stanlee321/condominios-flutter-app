// import 'dart:convert';
// import 'package:condominios/screens/qr_image.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DataBloc extends Bloc<DataEvent, List<Data>> {
//   DataBloc() : super([]);

//   @override
//   Stream<List<Data>> mapEventToState(DataEvent event) async* {
//     if (event is LoadDataEvent) {
//       try {
//         // Load the data from the JSON file
//         String jsonString = await rootBundle.loadString('assets/data.json');
//         List<dynamic> jsonList = json.decode(jsonString);
//         List<Data> dataList =
//             jsonList.map((json) => Data.fromJson(json)).toList();

//         // Emit the loaded data
//         yield dataList;
//       } catch (e) {
//         // Emit an error state if something goes wrong
//         yield state;
//       }
//     }
//   }
// }

// abstract class DataEvent {}

// class LoadDataEvent extends DataEvent {}
