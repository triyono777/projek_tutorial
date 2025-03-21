import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/note_model.dart';
import '../../services/note_service.dart';
import '../../widgets/custom_textfield.dart';

class AddNotePage extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _noteService = NoteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note')),
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
                  final note = Note(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: title,
                    content: content,
                  );
                  _noteService.addNote(note);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Title and Content cannot be empty');
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
