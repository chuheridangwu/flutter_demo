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

// 分页列表数据
class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = false;
  final PostDataSource _postsDataSource = PostDataSource();

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
              PaginatedDataTable(
                header: Text('Posts'),
                source: _postsDataSource,
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
                        
                        _postsDataSource._sort((post) => post.title.length,ascending);

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
                ]
              )
            ],
          )),
    );
  }
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  void _sort(getField(post),bool asceding){
    _posts.sort((a,b){
      if (!asceding) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
    return Comparable.compare(aValue,bValue);
    });
    notifyListeners();
  }
}
