import 'package:aula01/pages/dog_page.dart';
import 'package:aula01/utils/navi.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: () {
            print("Lista");
            setState(() {
              _gridView = false;

            });
          }),
          IconButton(icon: Icon(Icons.grid_on), onPressed: () {
            print("Grid");
            setState(() {
              _gridView = true;
            });
          })
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Batata", "assets/images/img1.jpg"),
      Dog("Golden", "assets/images/img2.jpg"),
      Dog("Pug", "assets/images/img3.jpeg"),
      Dog("Beagle", "assets/images/img4.jpeg"),
      Dog("Batatinha", "assets/images/img5.jpg"),
//      Dog("Batata", "assets/images/img1.jpg"),
//      Dog("Golden", "assets/images/img2.jpg"),
//      Dog("Pug", "assets/images/img3.jpeg"),
//      Dog("Beagle", "assets/images/img4.jpeg"),
//      Dog("Batatinha", "assets/images/img5.jpg"),
//      Dog("Batata", "assets/images/img1.jpg"),
//      Dog("Golden", "assets/images/img2.jpg"),
//      Dog("Pug", "assets/images/img3.jpeg"),
//      Dog("Beagle", "assets/images/img4.jpeg"),
//      Dog("Batatinha", "assets/images/img5.jpg"),
//      Dog("Batata", "assets/images/img1.jpg"),
//      Dog("Golden", "assets/images/img2.jpg"),
//      Dog("Pug", "assets/images/img3.jpeg"),
//      Dog("Beagle", "assets/images/img4.jpeg"),
//      Dog("Batatinha", "assets/images/img5.jpg"),
    ];

    if(_gridView) {
      return Container(
        color: Colors.black12,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: dogs.length,
            itemBuilder: (BuildContext context, int index) {
              return _itemView(dogs, index);
            }),
      );
    } else {
      return Container(
        color: Colors.black12,
        child: ListView.builder(
            itemExtent: 350,
            itemCount: dogs.length,
            itemBuilder: (BuildContext context, int index) {
              return _itemView(dogs, index);
            }),
      );
    }


  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white24,
              ),
              child: Text(
                dog.nome,
                style: TextStyle(fontSize: 26),
              ),
            ),
          )
        ],
      ),
    );
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
