import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sample/table_data_model.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_sample/tablepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("MOBILE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if(data.hasData) {

              var items = data.data as List<TableDataModel>;

              return GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(items.length, (index) {
                  return Container(
                    color: Colors.blueAccent,
                    child: InkWell(
                      onTap: () {
                        print("${items[index].name.toString()} was clicked");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TablePage(name: items[index].name.toString())));
                      },
                      child: Center(
                        child: Text(
                          items[index].name.toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  );
                }),
              );

            } else {
              return const Center(child: CircularProgressIndicator());
            }

          }
        ),
      ),
    );

    /*
    return Scaffold(
      body: ResponsiveLayout(mobileBody: MyMobileBody(), webBody: MyWebBody())
    );

     */
  }

  Future<List<TableDataModel>> readJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString('jsonfile/tables.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => TableDataModel.fromJson(e)).toList();
  }
}
