abstract class MainEvent {}

class ChangeIndexEvent extends MainEvent {
  final int index;

  ChangeIndexEvent(this.index);
}
