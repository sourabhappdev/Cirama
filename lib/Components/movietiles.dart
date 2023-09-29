import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemava/services/constants.dart';
import 'package:flutter/material.dart';
import '../Screens/DetailMovie.dart';



class MovieTiles extends StatelessWidget {

  const MovieTiles({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
        itemCount: snapshot.data.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Deatilmovie(
                      moviemodel: snapshot.data![index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  CachedNetworkImage(
                imageUrl: "${Imagepath}${snapshot.data[index].poster_path}",
                imageBuilder: (context, imageProvider) => Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage( //image size fill
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(), // you can add pre loader iamge as well to show loading.
                ), //show progress  while loading image
                errorWidget: (context, url, error) => Container(
                    width: 200,
                    height: 300,
                    color: Colors.grey,
                    child: Icon(Icons.error)),
                //show no image available image on error loading
              ),
            ),
          );
        },
      ),
    );
  }
}
