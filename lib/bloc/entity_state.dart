part of 'entity_bloc.dart';

@immutable
abstract class EntityState {
  const EntityState();
}

class EntityEmpty extends EntityState {
  EntityEmpty();
}

class EntityLoading extends EntityState {
  EntityLoading();
}

class EntityLoaded extends EntityState {
  late final List<ElementCard> elements;
  EntityLoaded({required this.elements});
}

class EntityError extends EntityState {
  EntityError();
}
