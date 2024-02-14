import 'package:products_app/data/remote/products_data_provider.dart';
import 'package:products_app/model/products_list_model/product_list_model.dart';
import 'package:products_app/model/products_list_model/products_result_model.dart';

class ProductsRepository{
  final ProductsDataProvider productsDataProvider;

  ProductsRepository(this.productsDataProvider);

  Future<List<ProductsListModel>> getProducts() async{
    try{
      final products = await productsDataProvider.getProducts();
      final productList = ProductsResultModel.fromJson(products);
      return productList.products!;
    }catch(e){
      throw e.toString();
    }
    
  }
}