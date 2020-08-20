import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'file_selector.dart';
import 'hud.dart';
import 'package:flutter/services.dart' show rootBundle;

class TableLayout extends StatefulWidget {
  @override
  _TableLayoutState createState() => _TableLayoutState();
}

class _TableLayoutState extends State<TableLayout> {
  List<List<dynamic>> data = [];

  Future<List<Map>> loadAsset() async {
    final myData = await rootBundle.loadString("CSVtest1.csv");
    List<List<dynamic>> data = CsvToListConverter().convert(myData);

    setState(() {});
    var headers = data[0];
    List<Map> vals = new List<Map>();
    for (var i = 1; i < data.length; i++) {
      var row = {};
      vals.add(row);
      for (var j = 0; j < headers.length; j++) {
        row[headers[j]] = data[i][j];
      }
    }
    return vals;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.folder_shared),
          onPressed: () async {
            List<Map> values = await loadAsset();

            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          values: values,
                        )));
          }),
      appBar: AppBar(
        title: Text("Table Layout and CSV"),
      ),
      // body: CsvFilePicker(),
    );
  }
}
