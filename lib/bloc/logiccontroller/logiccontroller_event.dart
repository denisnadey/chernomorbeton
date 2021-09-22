part of 'logiccontroller_bloc.dart';

@immutable
abstract class LogiccontrollerEvent {
  const LogiccontrollerEvent();
}

class LoadingEvent extends LogiccontrollerEvent {
  const LoadingEvent();
}

class AddElement extends LogiccontrollerEvent {
  final ElementCard newcard;
  const AddElement(this.newcard);
}

class DeleteElement extends LogiccontrollerEvent {
  final ElementCard thiselem;
  const DeleteElement(this.thiselem);
}

class EditElement extends LogiccontrollerEvent {
  const EditElement();
}

class RandomElement extends LogiccontrollerEvent {
  const RandomElement();
}
