import 'package:flutter/material.dart';
import 'package:kuis_123210052/Widgets/item.dart';
import 'package:kuis_123210052/Screens/login.dart';
import 'package:kuis_123210052/Models/top_album.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Albums'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        itemBuilder: (context, index) {
          return Items(
            topAlbum: topAlbumList[index],
          );
        },
        itemCount: topAlbumList.length,
      ),
    );
  }
}


