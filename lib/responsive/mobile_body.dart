import 'package:flutter/material.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
         title: const Text("MOBILE")
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.black,
                    child: Image.network('https://picsum.photos/250?image=1')
                )
              )
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.deepPurple,
                    height: 150
                  ),
                );
              })
            )
          ]
        )
    );
  }
}
