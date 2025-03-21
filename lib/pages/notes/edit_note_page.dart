import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/note_model.dart';
import '../../services/note_service.dart';
import '../../widgets/custom_textfield.dart';

class EditNotePage extends StatelessWidget {
  final Note note;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _noteService = NoteService();

  EditNotePage({required this.note}) {
    _titleController.text = note.title;
    _contentController.text = note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _titleController,
              label: 'Title',
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: _contentController,
              label: 'Content',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final content = _contentController.text;
                if (title.isNotEmpty && content.isNotEmpty) {
                  final updatedNote = Note(
                    id: note.id,
                    title: title,
                    content: content,
                  );
                  _noteService.updateNote(updatedNote);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Title and Content cannot be empty');
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
