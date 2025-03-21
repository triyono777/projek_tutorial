import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/note_model.dart';
import '../../services/note_service.dart';
import 'add_note_page.dart';
import 'edit_note_page.dart';

class NoteListPage extends StatelessWidget {
  final _noteService = NoteService();

  @override
  Widget build(BuildContext context) {
    final notes = _noteService.getNotes();
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => Get.to(() => EditNotePage(note: note)),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _noteService.deleteNote(note.id!);
                    Get.offAll(() => NoteListPage());
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNotePage()),
        child: Icon(Icons.add),
      ),
    );
  }
}
