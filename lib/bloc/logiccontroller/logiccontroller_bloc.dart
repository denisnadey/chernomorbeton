import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cbethonapp/element_model.dart';
import 'package:meta/meta.dart';

import '../../http_service.dart';

part 'logiccontroller_event.dart';
part 'logiccontroller_state.dart';

class LogiccontrollerBloc
    extends Bloc<LogiccontrollerEvent, LogiccontrollerState> {
  LogiccontrollerBloc() : super(LogiccontrollerInitial());

  @override
  Stream<LogiccontrollerState> mapEventToState(
    LogiccontrollerEvent event,
  ) async* {
    LogiccontrollerState lastState = state;

    if (event is AddElement) {
      if (lastState is LoadedReference) {
        List<ElementCard> emptyElementCard = [event.newcard];
        yield Loadedcontroller(emptyElementCard, lastState.reference);
      } else if (lastState is Loadedcontroller) {
        List<ElementCard> allocatedElementCard = lastState.elementcard;
        allocatedElementCard.add(event.newcard);
        yield Loadedcontroller(allocatedElementCard, lastState.reference);
      }
    } else if (event is DeleteElement) {
      if (lastState is Loadedcontroller) {
        List<ElementCard> allocatedElementCard = lastState.elementcard;
        allocatedElementCard
            .removeAt(allocatedElementCard.indexOf(event.thiselem));
        yield Loadedcontroller(allocatedElementCard, lastState.reference);
      }
    } else if (event is EditElement) {
    } else if (event is LoadingEvent) {
      yield Loadingcontroller();

      try {
        final List<ElementCard> reference =
            await HttpService().getElementCards();
        yield LoadedReference(reference);
      } catch (_) {
        print(_);
      }
    } else if (event is RandomElement) {
      if (lastState is LoadedReference) {
        yield Loadingcontroller();
        Random rndVal = Random();
        List<ElementCard> allocatedElementCard = [
          lastState.reference[rndVal.nextInt(lastState.reference.length - 1)]
        ];
        yield Loadedcontroller(allocatedElementCard, lastState.reference);
      } else if (lastState is Loadedcontroller) {
        yield Loadingcontroller();
        Random rndVal = Random();
        List<ElementCard> allocatedElementCard = lastState.elementcard;
        allocatedElementCard.add(lastState
            .reference[rndVal.nextInt(lastState.reference.length - 1)]);

        yield Loadedcontroller(allocatedElementCard, lastState.reference);
      }
    }
    print("click");
  }
}
