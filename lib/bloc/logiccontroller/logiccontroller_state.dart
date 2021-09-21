part of 'logiccontroller_bloc.dart';

@immutable
abstract class LogiccontrollerState {}

class LogiccontrollerInitial extends LogiccontrollerState {}

class Loadingcontroller extends LogiccontrollerState {}

class LoadedReference extends LogiccontrollerState {
  final List<ElementCard> reference;

  LoadedReference(this.reference);
}

class Loadedcontroller extends LogiccontrollerState {
  final List<ElementCard> reference;
  final List<ElementCard> elementcard;

  Loadedcontroller(this.elementcard, this.reference);
}
