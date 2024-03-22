import 'package:flutter/material.dart';
import 'package:kuis_123210052/Models/top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final TopAlbum topAlbum;

  const DetailPage ({
    super.key,
    required this.topAlbum,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topAlbum.albumName),
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: (){
                _launchURL(widget.topAlbum.albumurl);
              },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Image.network(widget.topAlbum.imageUrls),
              // child: ListView.builder(
              //   itemCount: widget.topAlbum.imageUrls.length,
              //   itemBuilder: (context, index){
              //     return Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Image.network(
              //         widget.topAlbum.imageUrls[index],
              //         fit: BoxFit.cover,
              //       ),
              //     );
              //   },
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    widget.topAlbum.albumName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    widget.topAlbum.singer,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.calendar_today),
                            const SizedBox(width: 2),
                            Text(
                                widget.topAlbum.releaseDate,
                                style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.house),
                            const SizedBox(width: 2),
                            Text(
                                widget.topAlbum.source,
                                style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(
                child:
                  Text(
                      'Song List',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                      ),
                    textAlign: TextAlign.center,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.topAlbum.songs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Color(0xFFD0C6E1FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            widget.topAlbum.songs[index],
                            // style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }
                )
              ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    launchUrl(Uri.parse(url));
  } else {
    throw 'Error cannot launch $url';
  }
}
