import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['Apple', 'Banbana', 'Lemon'];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choise = 'none';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0, // item之间的间隔
              runSpacing: 8.0, // 行与行之间的间隔
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Demo'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('喵'),
                  ),
                ),
                Chip(
                  label: Text('Demo'),
                  avatar: CircleAvatar(
                    child: Text('喵'),
                    backgroundImage: NetworkImage(
                        'https://resources.ninghao.net/images/overkill.png'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this Item',
                ),
                Divider(
                  color: Colors.grey,
                  indent: 12.0,
                ), //缩进
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 12.0,
                ),
                Container(
                  child: Text('actionchip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 12.0,
                ),
                Container(
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value){
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          }else{
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 12.0,
                ),
                Container(
                  child: Text('ChoiseChip: $_choise'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choise == tag,
                      selectedColor: Colors.black12,
                      onSelected: (value){
                        setState(() {
                          _choise = tag;
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'Banbana', 'Lemon'];
            _selected = [];
          });
        },
      ),
    );
  }
}
