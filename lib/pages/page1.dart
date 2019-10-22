import 'package:first_flutter_app/pages/peekoutDialog.dart';
import 'package:flutter/material.dart';

import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    print('page1 build');
    return Scaffold(
        // color: Colors.pink,
        // type: MaterialType.transparency,
        body: Column(
      children: <Widget>[
        RaisedButton(
          child: Text('点击进入下一页'),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (_) => Page2(), maintainState: true));
          },
        ),
        FloatingActionButton(
          child: Text('测试 Material组件上得MaterialType.transparency属性'),
          onPressed: () {},
        )
      ],
    ));
  }
}
