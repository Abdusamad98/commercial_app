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
  int selectedCategory = 0;
  List<ProductItem> products = [];
  List<String> categories = [];
  bool isLoaded = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void updateUI(String categoryName) async {
    isLoaded = true;
    products = await myRepository.getSpecificCategoryProducts(categoryName);
    isLoaded = false;
    setState(() {});
  }

  void _init() async {
    myRepository = MyRepository(
      apiProvider: ApiProvider(),
      localDatabase: LocalDatabase(),
    );
    categories = await myRepository.getAllCategories();
    products = await myRepository.getAllProducts();
    isLoaded = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Commercial App"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  categories.length,
                  (index) => GestureDetector(
                    onTap: () async {
                      selectedCategory = index;
                      setState(
                        () {},
                      );
                      updateUI(categories[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          color: selectedCategory == index
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Colors.grey.shade400, width: 2)),
                      child: Center(
                          child: Text(
                        categories[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: selectedCategory != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: !isLoaded,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                        products.length,
                        (index) =>
                            Expanded(child: Text(products[index].toString()))),
                  ),
                )),
            Visibility(
                visible: isLoaded,
                child: Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 12,
                    children: List.generate(
                      10,
                      (index) => Container(
                        color: Colors.red,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
