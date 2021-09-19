part of 'entity_bloc.dart';

@immutable
abstract class EntityEvent {
  const EntityEvent();
}

class EmptyEvent extends EntityEvent {
  const EmptyEvent();
}

class LoadingEvent extends EntityEvent {
  const LoadingEvent();
}

class LoadedEvent extends EntityEvent {
  const LoadedEvent();
}
