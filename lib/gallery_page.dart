import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/photo_view.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);
  final List<String> photos = [
    'https://miro.medium.com/v2/resize:fit:640/format:webp/1*5ii_O5RVerqU2a58ZwUhBg.jpeg',
    'https://miro.medium.com/v2/resize:fit:720/format:webp/1*5mBROWZlwjQ_VngzL995jw.jpeg',
    'https://upload.wikimedia.org/wikipedia/commons/b/b8/Balti-traditional-dress-pakistan.jpg',
    'https://scontent.fisb10-1.fna.fbcdn.net/v/t39.30808-6/308621102_414157747491135_5978377023606383262_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_ohc=joCDp4UrUnsAX9Bl8f-&_nc_ht=scontent.fisb10-1.fna&oh=00_AfCrw7iKNLGn4NbJIpjncesNeVoIhCYqQNAnMArzeV-jLg&oe=6413383E',
    'https://gilgitbaltistancuiture.files.wordpress.com/2015/07/hunza-cultural1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.all(1),
        itemCount: photos.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.all(0.5),

            child: InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => PhotoView(photos: photos, index: index))),
              child: Hero(
                tag: photos[index],
                child: CachedNetworkImage(
                  imageUrl: photos[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url)=>Container(color: Colors.grey, child: Center(child: CircularProgressIndicator(color: Colors.white,)),),
                  errorWidget: (context, url, error)=>Container(color: Colors.red.shade400),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
