import 'package:flutter/material.dart';


import '../helper/db_helper.dart';
import '../models/model.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        backgroundColor: const Color(0xffC5E4B5),
        centerTitle: true,
        title: Text(
          "$data Animal",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchData(type: '$data'),
        builder: (BuildContext context, AsyncSnapshot<List<Animal>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Animal>? allAnimalsList = snapshot.data;
            return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://source.unsplash.com/random/?$data",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: allAnimalsList!
                        .map(
                          (e) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: h * 0.8,
                          width: w * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.23,
                                width: w,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      e.image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Description : ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Animals are multicellular, eukaryotic organisms in the biological kingdom Animalia. With few exceptions, animals consume organic material, breathe oxygen, are able to move, can reproduce sexually, and grow from a hollow sphere of cells, the blastula, during embryonic development.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      e.description,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}