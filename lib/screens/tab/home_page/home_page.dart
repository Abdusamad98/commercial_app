import 'package:commercial_app/models/products/product_item.dart';
import 'package:commercial_app/repository/repository.dart';
import 'package:commercial_app/screens/tab/home_page/widgets/category_list_item.dart';
import 'package:commercial_app/screens/tab/home_page/widgets/product_grid_shimmer.dart';
import 'package:commercial_app/screens/tab/home_page/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.myRepository}) : super(key: key);

  final MyRepository myRepository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  List<ProductItem> products = [];
  List<String> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void updateUI(String categoryName) async {
    isLoading = true;
    products =
        await widget.myRepository.getSpecificCategoryProducts(categoryName);
    isLoading = false;
    setState(() {});
  }

  void _init() async {
    //1 -usul
    // categories = await widget.myRepository.getAllCategories();
    // products = await widget.myRepository.getAllProducts();

    //2 -usul
    final getTotals = await Future.wait([
      widget.myRepository.getAllCategories(),
      widget.myRepository.getAllProducts(),
    ]);
    categories = getTotals[0] as List<String>;
    products = getTotals[1] as List<ProductItem>;

    isLoading = false;
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
                    (index) => CategoryListItem(
                          onTap: () async {
                            selectedCategory = index;
                            setState(
                              () {},
                            );
                            updateUI(categories[index]);
                          },
                          categoryName: categories[index],
                          selectedCategoryIndex: selectedCategory,
                          index: index,
                        )),
              ),
            ),
            Visibility(
              visible: !isLoading,
              child: Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  children: List.generate(
                    products.length,
                    (index) => ProductListItem(
                      productItem: products[index],
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child:const ProductsGridShimmer(),
            )
          ],
        ));
  }
}
