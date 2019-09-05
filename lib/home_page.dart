import 'package:aula01/drawer_list.dart';
import 'package:aula01/pages/hello_listview.dart';
import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/utils/navi.dart';
import 'package:aula01/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1",),
            Tab(text: "TAB 2",),
          ]),
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            child: _img("assets/images/img5.jpg"),
          ),
        ]),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                mini: true,
                child: Icon(
                  Icons.add,
                  size: 18,
                ),
                onPressed: () {
                  _onClickFab();
                }),
            SizedBox(
              height: 2,
            ),
            FloatingActionButton(
                mini: true,
                child: Icon(
                  Icons.add_alarm,
                  size: 18,
                ),
                onPressed: () {
                  _onClickFab();
                }),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 200,
      child: PageView(
        children: <Widget>[
          _img("assets/images/img1.jpg"),
          _img("assets/images/img2.jpg"),
          _img("assets/images/img3.jpeg"),
          _img("assets/images/img4.jpeg"),
          _img("assets/images/img5.jpg"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (context) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: () => _onClickToast()),
              ],
            )
          ]);
    });
  }

  _button(context, String text, Function onPressed) {
    return BlueButton(text, onPressed: onPressed);
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(">> $s");
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("SNACKKKK!!!"),
      action: SnackBarAction(label: "OK", onPressed: () => print("ok!")),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("DIALOG"),
              actions: <Widget>[
                FlatButton(
                    highlightColor: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickFab() {}
}
