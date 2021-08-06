import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Map data = {};
  List<Widget> template = [];
  List<Widget> templateEmpty = [];
  List<Widget> listBody() {
    if (data.isEmpty) {
      templateEmpty.add(Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Text(
            'Your list is empty',
            style: TextStyle(
              color: Colors.grey[200],
              letterSpacing: 2.0,
              fontSize: 24.0,
            ),
          ),
        ),
      ));
      return templateEmpty;
    } else {
      template.add(Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                title: Text(data['name']),
                subtitle: Text(
                  "${data['genre']} | ${data['language']} | ${data['rating']}",
                  style: TextStyle(color: Colors.grey[500]),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data['image']),
                ),
              ),
            ),
          )
        ],
      ));
      return template;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dynamic result = await Navigator.pushNamed(context, '/search');
            setState(() {
              data = {
                'name': result['name'],
                'genre': result['genre'],
                'language': result['language'],
                'rating': result['rating'],
                'image': result['image'],
              };
            });
          },
          child: Icon(Icons.search),
          backgroundColor: Colors.grey[900],
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('Your List'),
          centerTitle: true,
        ),
        body: Column(
          children: listBody(),
        ));
  }
}
