import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/constants.dart';

class CastTiles extends StatelessWidget {
  const CastTiles({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override

  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        itemCount: snapshot.data.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  CachedNetworkImage(
                  imageUrl: "$Imagepath${snapshot.data[index].profile_path}",
                  imageBuilder: (context, imageProvider) => Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage( //image size fill
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    width: 150,
                    height: 200,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(), // you can add pre loader iamge as well to show loading.
                  ), //show progress  while loading image
                  errorWidget: (context, url, error) => Container(
                      width: 150,
                      height: 200,
                      color: Colors.grey,
                      child: const Icon(Icons.error)),
                  //show no image available image on error loading
                ),

              ),
              const SizedBox(height: 10,),
              Text(
                '${snapshot.data[index].name}',
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );

        },
      ),
    );
  }
}

