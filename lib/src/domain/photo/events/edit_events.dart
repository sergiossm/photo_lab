import 'package:photo_lab/src/domain/photo/events/i_edit_event.dart';

class UndoStackEmpty implements IEditEvent {
  const UndoStackEmpty();
}

class UndoStackNotEmpty implements IEditEvent {
  const UndoStackNotEmpty();
}

class RedoStackNotEmpty implements IEditEvent {
  const RedoStackNotEmpty();
}

class RedoStackEmpty implements IEditEvent {
  const RedoStackEmpty();
}
