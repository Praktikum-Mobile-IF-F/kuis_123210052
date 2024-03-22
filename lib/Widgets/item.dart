import 'package:flutter/material.dart';
import 'package:kuis_123210052/Screens/detail.dart';
import 'package:kuis_123210052/Models/top_album.dart';

class Items extends StatelessWidget {
  final TopAlbum topAlbum;

  const Items ({
    super.key,
    required this.topAlbum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(topAlbum: topAlbum),
            ),
          );
        },
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    child: Image.network(topAlbum.imageUrls, fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
