import 'package:flutter/material.dart';


class PopupMenuDemo extends StatefulWidget {
  @override
  _PopupMenuDemoState createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {

  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_currentMenuItem),
            PopupMenuButton(
              onSelected: (value){
                print(value);
                setState(() {
                                  _currentMenuItem=value;
                                });
              },
              itemBuilder: (BuildContext context)=>[
                PopupMenuItem(
                  value: 'Home',
                  child: Text('Home'),
                ),
                PopupMenuItem(
                  value: 'Discover',
                  child: Text('Discover'),
                ),
                PopupMenuItem(
                  value: 'Commnunity',
                  child: Text('Commnunity'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}