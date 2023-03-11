import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _textFieldController = TextEditingController();
  List<String> _notes = [];

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/notes.json');
  }

  void _addNote() {
    setState(() {
      if (_textFieldController.text.isNotEmpty) {
        _notes.add(_textFieldController.text);
        _textFieldController.clear();
        _saveNotes();
      }
    });
  }

  void _removeNoteAtIndex(int index) {
    setState(() {
      _notes.removeAt(index);
      _saveNotes();
    });
  }

  void _saveNotes() async {
    final file = await _localFile;
    final notesJson = json.encode(_notes);
    await file.writeAsString(notesJson);
  }

  void _loadNotes() async {
    try {
      final file = await _localFile;
      final notesJson = await file.readAsString();
      final List<dynamic> notesList = json.decode(notesJson);
      final notes = notesList.map((note) => note as String).toList();
      setState(() {
        _notes = notes;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading notes: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_notes[index]),
                    onDismissed: (direction) {
                      _removeNoteAtIndex(index);
                    },
                    child: ListTile(
                      title: Text(_notes[index]),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a note',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    onEditingComplete: _addNote,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _addNote,
                    child: const Text('Ekle'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
