import 'package:commercial_app/local_data/local_database.dart';
import 'package:commercial_app/local_data/storage.dart';
import 'package:commercial_app/models/products/product_item.dart';
import 'package:commercial_app/service/api_provider.dart';

class MyRepository {
  MyRepository({
    required this.apiProvider,
    required this.localDatabase,
  });

  final ApiProvider apiProvider;
  final LocalDatabase localDatabase;

  Future<List<ProductItem>> getAllProducts() => apiProvider.getProductsList();

  Future<List<ProductItem>> getSpecificCategoryProducts(String categoryName) =>
      apiProvider.getSpecificCategoryProducts(
        categoryName: categoryName,
      );

  Future<ProductItem> getSingleProduct(int productId) =>
      apiProvider.getSingleProduct(productId: productId);

  Future<ProductItem> addProductToServer(ProductItem productItem) =>
      apiProvider.addNewProductToServer(productItem: productItem);

  Future<List<String>> getAllCategories() => apiProvider.getAllCategories();

  Future<String> loginUser(
          {required String username, required String password}) =>
      apiProvider.loginUser(username: username, password: password);

  Future<void> saveToken({required String token}) async {
    await StorageRepository.getInstance();
    await StorageRepository.putString(key: "token", value: token);
  }
}
