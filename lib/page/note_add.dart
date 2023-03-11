import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/product/color/project_color.dart';
import 'package:meal/product/util/constans.dart';
import 'package:path_provider/path_provider.dart';
import 'ayet_ekranı.dart';

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
    // Dismissible widget'ı hemen kaldırılıyor
    if (mounted) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }
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
      backgroundColor: ProjectColor().indicatorBG,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        elevation: ProjectNum().zero,
        actions: const [PersonButton()],
        backgroundColor: ProjectColor().transparent,
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
                      setState(() {
                        _removeNoteAtIndex(index);
                      });
                    },
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            _notes[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: ProjectColor().ddddddColor,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Divider(color: ProjectColor().ddddddColor),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: ProjectEdgeInsets().textField,
                    child: TextFormField(
                      controller: _textFieldController,
                      onEditingComplete: _addNote,
                      style: TextStyle(
                        color: ProjectColor().indicatorBG,
                        fontSize: ProjectNum().titleMedium,
                      ),
                      cursorColor: ProjectColor().indicatorBG,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ProjectColor().ddddddColor,
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: ProjectColor().indicatorBG,
                        ),
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.edit_note,
                          color: ProjectColor().indicatorBG,
                          size: ProjectNum().titleLarge,
                        ),
                        isDense: true,
                        filled: true,
                        hintText: "",
                        fillColor: ProjectColor().ddddddColor,
                        contentPadding: ProjectEdgeInsets().horizontal20,
                        labelStyle:
                            TextStyle(color: ProjectColor().indicatorBG),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: ProjectEdgeInsets().textFieldButton,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          ProjectColor().ddddddColor,
                        ),
                      ),
                      onPressed: _addNote,
                      child: Padding(
                        padding: ProjectEdgeInsets().vertical20 / 2,
                        child: Icon(
                          Icons.add,
                          color: ProjectColor().indicatorBG,
                        ),
                      ),
                    ),
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
