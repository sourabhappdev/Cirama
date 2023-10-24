import 'package:cinemava/services/backend.dart';
import 'package:flutter/material.dart';

import 'DetailMovie.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
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

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        title: const Text(
          "CIRAMA",
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
            child: TextField(
              enabled: true,
              decoration: InputDecoration(
                hintText: "Search Only Movies",
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                suffixIconColor: Colors.white,
                suffixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.white,
                    )),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.white,
                    )),
              ),
              keyboardType: TextInputType.name,
              controller: controller,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: Api().searchMovie(controller.text.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData && controller.text.isNotEmpty) {
                return Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount:
                          snapshot.data!.length > 8 ? 8 : snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Deatilmovie(
                                      moviemodel: snapshot.data![index]),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: manyColors[index],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Text(
                                          "${snapshot.data![index].title}",
                                          style: const TextStyle(
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Center(
                  child: SizedBox(
                    child: Container(),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
