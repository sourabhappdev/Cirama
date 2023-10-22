import 'package:cinemava/Models/genres.dart';
import 'package:flutter/material.dart';
import '../services/backend.dart';
import 'package:cinemava/Screens/Genres_Movies.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  late Future<List<Genresmodel>> genres;
  List<Color> manyColors = [
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.white60,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.green,
    Colors.blueGrey,
    Colors.pink,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.green,
    Colors.blueGrey,
    Colors.lime,

  ];

  @override
  void initState() {
    super.initState();
    genres = Api().getMovieGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        title: Text(
          "CIRAMA",
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
              child: TextField(
                enabled: true,
                decoration: InputDecoration(
                  suffixIconColor: Colors.white,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.white,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                child: FutureBuilder(
                  future: genres,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          mainAxisExtent: 100,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => GenresMovies(id: snapshot.data?[index].id),));
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: manyColors[index],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                      "${snapshot.data![index].name}",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
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
        ],
      ),
    );
  }
}
