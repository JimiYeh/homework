import 'package:flutter/material.dart';
import 'package:homework/dio.dart';

import 'api.dart';
import 'model/album_list_entity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final api = API(DioClient("https://jsonplaceholder.typicode.com/").dio);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: api.getAlbumList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MyColorList(snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          },
        )
    );
  }
}


class MyColorList extends StatelessWidget {

  final List<AlbumListEntity> list;

  MyColorList(this.list);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Image.network(list[index].thumbnailUrl);
        },
    );
  }
}
