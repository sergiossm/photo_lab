import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/events/edit_events.dart';
import 'package:photo_lab/src/domain/photo/events/i_edit_event.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:rxdart/rxdart.dart';

class EditHistoryService {
  EditHistoryService() {
    _editHistorySubject
      ..add(right(const UndoStackEmpty()))
      ..add(right(const RedoStackEmpty()));
  }

  // In-memory stacks for undo and redo
  final List<Filter?> _undoStack = [];
  final List<Filter?> _redoStack = [];

  // Subject to notify listeners of changes in the edit history
  final _editHistorySubject = BehaviorSubject<Either<Failure, IEditEvent>>();

  // Stream to listen to changes in the edit history
  Stream<Either<Failure, IEditEvent>> get editHistoryStream => _editHistorySubject.stream;

  void applyFilter(Filter? filter) {
    if ((filter != null && filter == _undoStack.lastOrNull) || filter == null && _undoStack.lastOrNull == null) return;

    _undoStack.add(filter);
    _editHistorySubject.add(right(const UndoStackNotEmpty()));
    _redoStack.clear();
    _editHistorySubject.add(right(const RedoStackEmpty()));
    debugPrint('Undo stack: $_undoStack');
  }

  Option<Filter?> get currentFilter {
    return _undoStack.lastOption;
  }

  void undo() {
    if (_undoStack.isNotEmpty) {
      final filter = _undoStack.removeLast();
      _redoStack.add(filter);
      _editHistorySubject
        ..add(
          right(_undoStack.isNotEmpty ? const UndoStackNotEmpty() : const UndoStackEmpty()),
        )
        ..add(right(_redoStack.isNotEmpty ? const RedoStackNotEmpty() : const RedoStackEmpty()));
    }
    debugPrint('Undo stack: $_undoStack');
  }

  void redo() {
    if (_redoStack.isNotEmpty) {
      final filter = _redoStack.removeLast();
      _undoStack.add(filter);
      _editHistorySubject
        ..add(right(_undoStack.isNotEmpty ? const UndoStackNotEmpty() : const UndoStackEmpty()))
        ..add(right(_redoStack.isNotEmpty ? const RedoStackNotEmpty() : const RedoStackEmpty()));
    }
  }

  void clearHistory() {
    _undoStack.clear();
    _redoStack.clear();
    _editHistorySubject
      ..add(right(const UndoStackEmpty()))
      ..add(right(const RedoStackEmpty()));
  }

  void dispose() {
    if (!_editHistorySubject.isClosed) {
      _editHistorySubject.close();
    }
  }
}
