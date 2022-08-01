import 'package:commercial_app/local_data/local_database.dart';
import 'package:commercial_app/local_data/storage.dart';
import 'package:commercial_app/models/product_item.dart';
import 'package:commercial_app/service/api_provider.dart';

class MyRepository {
  MyRepository({
    required this.apiProvider,
    required this.localDatabase,
    required this.myStorage,
  });

  final ApiProvider apiProvider;
  final LocalDatabase localDatabase;
  final MyStorage myStorage;

  Future<List<ProductItem>> getAllProducts() => apiProvider.getProductsList();

  Future<ProductItem> getSingleProduct(int productId) =>
      apiProvider.getSingleProduct(productId: productId);

  Future<ProductItem> addProductToServer(ProductItem productItem) =>
      apiProvider.addNewProductToServer(productItem: productItem);
}
