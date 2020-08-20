import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import '../models/entry.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final picker = ImagePicker();
  String imagePath;

  void initState() {
    super.initState();
  }

  // Allows user to grab image from image gallery
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    //TODO: HANDLE BACK BUTTON ON IMAGE SELECTOR
    // print(pickedFile);
    // if (pickedFile == null) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => ListScreen()));
    // }
    imagePath = pickedFile.path;
  }

  // int getWasteCount(){
  //   if(wasteCount)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(children: [
          const Text('Wasteagram'),
          //Text('WasteCount: ' + wasteCount.toString()),
        ]),
      ),
      body: PostList(/*wasteCount: wasteCount*/),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Semantics(
        label: "New Post",
        hint: "Touch to create new post",
        child: FloatingActionButton(
          key: Key('postButton'),
          child: Icon(Icons.add),
          onPressed: () async {
            // wait for image to be selected before navigating
            await getImage();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewPostScreen(imagePath: imagePath)));
          },
        ),
      ),
    );
  }
}

class PostList extends StatefulWidget {
  // final int wasteCount;
  // PostList({this.wasteCount});

  @override
  _PostListState createState() => _PostListState(/*wasteCount: wasteCount*/);
}

class _PostListState extends State<PostList> {
  // int wasteCount;
  // _PostListState({this.wasteCount});

  @override
  Widget build(BuildContext context) {
    // ListScreenState appState =
    //     context.findAncestorStateOfType<ListScreenState>();

    // Scrollable list view
    Widget _buildListItem(BuildContext context, Entry entry) {
      print(entry.url);
      return Semantics(
        label: "Date: ${entry.date}",
        child: ListTile(
            title: Row(children: [
              Expanded(child: Text(entry.date)),
              Text(entry.itemCount.toString()),
            ]),
            onTap: () {
              //print(entry.url);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(entry: entry)));
            }),
      );
    }

    return StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.data.documents.isEmpty) {
            return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  Entry entry = Entry(snapshot.data.documents[index]);
                  //appState.wasteCount += entry.itemCount;
                  return _buildListItem(context, entry);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
