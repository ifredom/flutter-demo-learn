import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('page1 build');
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            SizedBox(
              width: 100.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(60.0, 100.0),
                              bottomRight: Radius.elliptical(60.0, 100.0))),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "导航栏",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ))
                ],
              ),
            ),
            Column(
              children: <Widget>[
                _buildButton(
                  title: 'Materia组件属性： transparency',
                  callback: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        // barrierDismissible: true,
                        maintainState: false,
                        opaque: false,
                        pageBuilder: (_, anim1, anim2) => SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(1.0, 0.0), end: Offset.zero)
                              .animate(anim1),
                          child: SamplePage(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({String title = '按钮', Function callback}) {
    return RaisedButton(
      child: Text(title),
      onPressed: () {
        callback();
      },
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        child: Stack(children: <Widget>[
          RaisedButton(
            child: Text("关闭"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Align(
            alignment: Alignment(1.2, -1.2),
            child: GestureDetector(
              child: Container(child: Text('X')),
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print("object");
              },
            ),
          )
        ]),
      ),
    );
  }
}
