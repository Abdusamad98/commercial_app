import 'package:commercial_app/local_data/local_database.dart';
import 'package:commercial_app/local_data/storage.dart';
import 'package:commercial_app/models/product_item.dart';
import 'package:commercial_app/repository/repository.dart';
import 'package:commercial_app/service/api_provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MyRepository myRepository;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    myRepository = MyRepository(
      apiProvider: ApiProvider(),
      localDatabase: LocalDatabase(),
      myStorage: MyStorage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("REquests"),
        ),
        body: FutureBuilder<List<ProductItem>>(
          future: myRepository.getAllProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else if (snapshot.hasData) {
              var items = snapshot.data!;
              return ListView(
                children: List.generate(
                    items.length, (index) => Text(items[index].toString())),
              );
            } else {
              return GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 12,
                children: List.generate(
                  10,
                  (index) => Container(
                    color: Colors.red,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }
}
