import 'package:flutter/material.dart';
import 'package:csv/csv.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<List<dynamic>>? csvData;

  Future<List<List<dynamic>>> processCsv() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/data.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Csv Reader"),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: csvData == null
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Press Add',
                    style: TextStyle(color: Colors.teal, fontSize: 19),
                  ),
                ))
              : DataTable(
                  columns: csvData![0]
                      .map(
                        (item) => DataColumn(
                          label: Text(
                            item.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  rows: csvData!
                      .map(
                        (csvrow) => DataRow(
                          cells: csvrow
                              .map(
                                (csvItem) => DataCell(
                                  Text(
                                    csvItem.toString(),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          csvData = await processCsv();
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
