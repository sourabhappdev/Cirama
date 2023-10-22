import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../services/backend.dart';
import '../services/constants.dart';
import 'package:cinemava/Screens/DetailMovie.dart';

class GenresMovies extends StatefulWidget {
  const GenresMovies({super.key, this.id});
  final id;
  @override
  State<GenresMovies> createState() => _GenresMoviesState();
}

class _GenresMoviesState extends State<GenresMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 30,
        title: Text(
          "CIRAMA",
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: Api().getgenre(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                      mainAxisExtent: 300,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Deatilmovie(
                                    moviemodel: snapshot.data![index],
                                  ),
                                ));
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Imagepath}${snapshot.data?[index].poster_path}",
                            imageBuilder: (context, imageProvider) => Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  //image size fill
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 300,
                              child:
                                  CircularProgressIndicator(), // you can add pre loader iamge as well to show loading.
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
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
