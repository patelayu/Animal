import 'package:flutter/material.dart';

import '../models/model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment(-1.8,0),
          child: Text(
            "  Animals App",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,),
          ),
        ),
        backgroundColor: const Color(0xff565051),
        elevation: 5,

        leading: Container(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        children: AnimalsType.animalType
            .map(
              (e) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                "SecondPage",
                arguments: e,
              );
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 350,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://source.unsplash.com/random/?$e",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom:  Radius.circular(20),
                  ),
                  color: Colors.black.withOpacity(0.50),
                ),
                child: Text(
                  "$e Animal",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        )
            .toList(),
      ),
      backgroundColor: const Color(0xffE3F9A6),
    );
  }
}