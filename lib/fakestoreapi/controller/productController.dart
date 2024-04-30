import 'package:firestoreapi_products/fakestoreapi/services/httpServices.dart';
import 'package:get/get.dart';

class Product_Controller extends GetxController{
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    readProducts();
    super.onInit();
  }
  void readProducts() async{
    try{
      isLoading(true);
      var products = await HttpService.fetchProduct();
      if(products!= null){
        productList.value = products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}