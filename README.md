# 📝 Note App - Flutter với Provider

Ứng dụng ghi chú đơn giản được xây dựng bằng Flutter và sử dụng Provider để quản lý state. Cho phép người dùng tạo, chỉnh sửa và xóa ghi chú với cập nhật realtime.

## ✨ Tính năng

- ✅ Thêm ghi chú mới
- ✅ Xem danh sách tất cả ghi chú
- ✅ Chỉnh sửa ghi chú
- ✅ Xóa ghi chú (có xác nhận)
- ✅ Hiển thị thời gian tạo ghi chú
- ✅ Cập nhật UI realtime
- ✅ Validation dữ liệu đầu vào

## 🛠️ Công nghệ sử dụng

- **Flutter**: Framework UI
- **Provider**: Quản lý state
- **ChangeNotifier**: Pattern để notify UI updates
- **Material Design 3**: UI components

## 📋 Yêu cầu

- Flutter SDK: >= 3.0.0
- Dart SDK: >= 3.0.0

## 🚀 Cài đặt

### 1. Clone repository

```bash
git clone <repository-url>
cd note_app
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Chạy ứng dụng

```bash
flutter run
```

## 📁 Cấu trúc dự án

```
lib/
├── main.dart                           # Entry point của app
├── models/
│   └── note.dart                       # Model cho Note
├── providers/
│   └── note_provider.dart              # Provider quản lý state
└── screens/
    ├── notes_list_screen.dart          # Màn hình danh sách ghi chú
    └── add_edit_note_screen.dart       # Màn hình thêm/sửa ghi chú
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
```

## 🎯 Kiến trúc

### Provider Pattern

Ứng dụng sử dụng **Provider State Management** với các thành phần chính:

#### 1. **Model (Note)**
```dart
class Note {
  final String id;
  String title;
  String content;
  DateTime createdAt;
}
```

#### 2. **Provider (NoteProvider)**
- Extends `ChangeNotifier`
- Quản lý danh sách notes
- Cung cấp các methods:
  - `addNote()`: Thêm ghi chú mới
  - `updateNote()`: Cập nhật ghi chú
  - `deleteNote()`: Xóa ghi chú
  - `getNoteById()`: Lấy ghi chú theo ID

#### 3. **UI Components**
- **NotesListScreen**: Hiển thị danh sách ghi chú
  - Sử dụng `Consumer<NoteProvider>` để lắng nghe thay đổi
  - FloatingActionButton để thêm ghi chú mới
- **AddEditNoteScreen**: Form thêm/sửa ghi chú
  - TextField cho tiêu đề và nội dung
  - Form validation
  - Provider.of để gọi methods không cần rebuild

## 🔄 Flow hoạt động

### Thêm ghi chú mới
1. User nhấn FloatingActionButton
2. Navigate đến AddEditNoteScreen
3. User nhập tiêu đề và nội dung
4. Nhấn Save
5. NoteProvider.addNote() được gọi
6. notifyListeners() trigger UI update
7. NotesListScreen tự động rebuild và hiển thị ghi chú mới

### Sửa ghi chú
1. User tap vào ghi chú trong list
2. Navigate đến AddEditNoteScreen với noteId
3. Load dữ liệu ghi chú hiện tại
4. User chỉnh sửa và Save
5. NoteProvider.updateNote() được gọi
6. UI tự động cập nhật

### Xóa ghi chú
1. User nhấn icon delete
2. Hiển thị dialog xác nhận
3. Nếu confirm, NoteProvider.deleteNote() được gọi
4. UI tự động cập nhật

## 👨‍💻 Tác giả

*Cao Đức Tâm*

## 📧 Liên hệ

- Email: ductam2024@gmail.com
- GitHub: [@caoductam](https://github.com/caoductam)

---
