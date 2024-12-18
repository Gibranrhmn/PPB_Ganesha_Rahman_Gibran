import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class HomePage extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan'),
      ),
      body: Obx(() {
        return noteController.notes.isEmpty
            ? Center(child: Text('Belum ada catatan'))
            : ListView.builder(
                itemCount: noteController.notes.length,
                itemBuilder: (context, index) {
                  final note = noteController.notes[index];
                  return Card(
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.description),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => noteController.deleteNoteAt(index),
                      ),
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
