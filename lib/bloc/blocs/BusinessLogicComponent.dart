import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/bloc/data/repository/Repository.dart';
import 'package:bloc_pattern/bloc/events/EventDB.dart';

class BusinessLogicComponent extends Bloc<EventDB, String> {
  final Repository repository;

  BusinessLogicComponent(this.repository);

  @override
  String get initialState => "empty";

  @override
  Stream<String> mapEventToState(EventDB event) async* {
    switch (event) {
      case EventDB.GET:
        repository.setNum(Random().nextInt(10));
        yield await repository.getAllData();
        break;
      case EventDB.POST:
        break;
      case EventDB.DELETE:
        break;
      case EventDB.UPDATE:
        break;
    }
  }
}