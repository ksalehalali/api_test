import 'package:api_hassan/service/postService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: API(),
    );
  }
}

class API extends StatefulWidget {
  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  fetchPhotos() async {
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);

      print(obj[0]['title']);
      return obj;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: null,
      // Center(
      //   child: FutureBuilder(
      //     future:fetchPhotos() ,
      //     builder: (ctx,snapShot){
      //      if(snapShot.connectionState == ConnectionState.waiting){
      //        return CircularProgressIndicator();
      //      }else{
      //        return ListView.builder(
      //          //itemCount: 10,
      //          itemBuilder: (ctx, index) {
      //            return ListTile(
      //              title: Text(snapShot.data[index]['title']),
      //              subtitle: Text(snapShot.data[index]['id'].toString()),
      //              leading: CircleAvatar(backgroundImage: NetworkImage(snapShot.data[index]['thumbnailUrl']),),
      //            );
      //          },
      //        );
      //      }
      //     },
      //   ),
      // ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),

          onPressed: ()async{

            var p = PostApi();
            List<Post> data = await p.fetchData();

            for(final i in data){
              print('${i.id}');
              print('${i.userId}');
              print('${i.title}');
              print('${i.body}');

            }
          },


    ),
    );

  }
}
