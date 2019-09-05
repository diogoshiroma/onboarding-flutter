import 'package:aula01/utils/navi.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Diogo Shiroma"),
                accountEmail: Text("diogo@brainn.co"),
                currentAccountPicture: CircleAvatar(
//                backgroundImage: AssetImage("assets/images/img1.jpg"),
                  backgroundImage: NetworkImage("https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/1441771/910/607/m1/fpnw/wm0/detective-avatar-icon-01-.jpg?1468239271&s=508b9d9af61801cde9844ada037ee3b5"),
//                child: Icon(Icons.supervised_user_circle),

                ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("ITEM 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("ITEM 2");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("ITEM 3");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
