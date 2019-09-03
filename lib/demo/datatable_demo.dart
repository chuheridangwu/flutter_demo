import 'package:flutter/material.dart';
import 'package:flutter_demo/model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              DataTable(
                sortColumnIndex: _sortColumnIndex, //排序
                sortAscending: _sortAscending, //升序或者降序
                onSelectAll: (bool value) {
                  //全选
                  setState(() {
                    posts.map((item) {
                      item.selected = value;
                    }).toList();
                  });
                },
                columns: [
                  DataColumn(
                      label: Container(
                        // width: 150.0,
                        child: Text('Title'),
                      ),
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;
                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(
                    label: Text('Author'),
                  ),
                  DataColumn(
                    label: Text('Image'),
                  )
                ],
                rows: posts.map((item) {
                  return DataRow(
                    selected: item.selected,
                    onSelectChanged: (value) {
                      setState(() {
                        if (item.selected != value) {
                          item.selected = value;
                        }
                      });
                    },
                    cells: [
                      DataCell(Text(item.title)),
                      DataCell(Text(item.author)),
                      DataCell(Image.network(item.imageUrl)),
                    ],
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}
