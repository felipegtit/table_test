import 'package:flutter/material.dart';
class MyWebBody extends StatelessWidget {
  const MyWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
            title: const Text("WEB")
        ),
        body: Row(
          children: [
            //fist column
            Expanded(
              child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                                color: Colors.black,
                                child: Image.network('https://picsum.photos/250?image=9')
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
              ),
            ),

            //second column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: Colors.deepPurpleAccent,
              ),
            )
          ],
        )
    );
  }
}
