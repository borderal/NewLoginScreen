import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  @override
  static String id = '/home_page';
  HomePage({this.values});
  final List values;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int active = 0;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 2, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(.05),
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading:
            MediaQuery.of(context).size.width < 1900 ? true : false,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'skudrlogo.png',
                  scale: 3,
                ),
              ),
            ]),
        actions: <Widget>[
          SizedBox(width: 32),
          SizedBox(width: 32),
          CircleAvatar(
            backgroundColor: Color(0xfff1b60f),
            child: Text('A'),
          ),
          SizedBox(width: 32),
          Container(
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(width: 32),
        ],
        // automaticallyImplyLeading: false,
      ),
      drawer: Padding(
          padding: EdgeInsets.only(top: 56),
          child: Drawer(
            child: listDrawerItems(true),
            elevation: 2.0,
          )),
      body: Row(
        children: <Widget>[
          MediaQuery.of(context).size.width < 1300
              ? Container()
              : Card(
                  elevation: 0.0,
                  child: Container(
                      margin: EdgeInsets.all(0),
                      height: MediaQuery.of(context).size.height,
                      width: 300,
                      color: Colors.white,
                      child: listDrawerItems(false)),
                ),
          Container(
            width: MediaQuery.of(context).size.width < 1300
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width - 310,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Dashboard(data: widget.values),
                Settings(),

                //FormMaterial(),
                //HeroAnimation(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(
      children: <Widget>[
        FlatButton(
          color: tabController.index == 0 ? Colors.grey : Colors.white,
          //color: Colors.grey[100],
          onPressed: () {
            tabController.animateTo(0);
            drawerStatus ? Navigator.pop(context) : print("");
          },

          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(
                  Icons.dashboard,
                  color: tabController.index == 0
                      ? Colors.white
                      : Color(0xff696969),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Google Sans',
                  ),
                ),
              ]),
            ),
          ),
        ),
        FlatButton(
          color: tabController.index == 1 ? Colors.grey : Colors.white,
          onPressed: () {
            print(tabController.index);
            tabController.animateTo(1);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(
                  Icons.exit_to_app,
                  color: tabController.index == 1
                      ? Colors.white
                      : Color(0xff696969),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Google Sans',
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
