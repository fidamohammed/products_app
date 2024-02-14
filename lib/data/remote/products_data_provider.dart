import 'package:http/http.dart' as http;

class ProductsDataProvider{
  
  Future<String> getProducts() async{
    try{
      final apiResult = await http.get(Uri.parse('https://dummyjson.com/products'));
      return apiResult.body;
    }catch(e){
      return e.toString();
    }
  }
}