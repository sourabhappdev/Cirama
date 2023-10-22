import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemava/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/DetailMovie.dart';



class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index, realIndex) {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
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
                  width: 200,
                  height: 300,
                  alignment: Alignment.center,
                  child: const Center(child: CircularProgressIndicator()), // you can add pre loader iamge as well to show loading.
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
        options: CarouselOptions(
          autoPlay: true,
          height: 300,
          pageSnapping: true,
          viewportFraction: 0.55,
          autoPlayInterval: Duration(milliseconds: 1500),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}


