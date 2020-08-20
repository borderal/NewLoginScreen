import 'package:file_picker_web/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'dart:html';

class CsvFilePicker extends StatefulWidget {
  @override
  _CsvFilePickerState createState() => _CsvFilePickerState();
}

class _CsvFilePickerState extends State<CsvFilePicker> {
  File _filePath;
  Future<File> pickFile() async {
    _filePath = await FilePicker.getFile(allowedExtensions: ['csv']);
    return _filePath;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      pickFile();
    });
  }
}
