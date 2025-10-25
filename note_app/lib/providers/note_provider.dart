import 'package:flutter/foundation.dart';
import '../models/note.dart';

class NoteProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  // Getter để lấy danh sách notes
  List<Note> get notes => [..._notes];

  // Thêm note mới
  void addNote(String title, String content) {
    final newNote = Note(
      id: DateTime.now().toString(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    _notes.insert(0, newNote); // Thêm vào đầu danh sách
    notifyListeners(); // Thông báo cho UI cập nhật
  }

  // Cập nhật note
  void updateNote(String id, String title, String content) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index >= 0) {
      _notes[index].title = title;
      _notes[index].content = content;
      notifyListeners();
    }
  }

  // Xóa note
  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  // Lấy một note theo id
  Note? getNoteById(String id) {
    try {
      return _notes.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }
}
