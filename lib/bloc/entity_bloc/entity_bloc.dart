import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cbethonapp/element_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../http_service.dart';

part 'entity_event.dart';
part 'entity_state.dart';

class EntityBloc extends Bloc<EntityEvent, EntityState> {
  EntityBloc() : super(EntityLoading());

  @override
  Stream<EntityState> mapEventToState(
    EntityEvent event,
  ) async* {
    yield EntityLoading();
    try {
      final elems = await HttpService().getElementCards();
      yield EntityLoaded(elements: elems);
    } catch (_) {
      print(_);
      yield EntityError();
    }
  }
}
