// import 'package:firestoreapi_products/fakestoreapi/controller/productController.dart';
// import 'package:firestoreapi_products/fakestoreapi/screen/home/Tile/productTile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main(){
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Product_Main(),));
// }
// class Product_Main extends StatelessWidget {
//   Product_Controller productController = Get.put(Product_Controller());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("TrenDz",style: GoogleFonts.sansita(fontSize: 25,fontWeight: FontWeight.bold),),
//         backgroundColor: Color.fromARGB(255, 163, 24, 194),
//         elevation: 5,
//       ),
//       body: Column(
//         children: [
//           Text(
//             "Shop Your TrenDz....",
//             style:
//                 GoogleFonts.sansita(fontSize: 25, fontWeight: FontWeight.bold),
//           ),
//           Expanded(child: Obx(() {
//             if (productController.isLoading.value) {
//               return Center(
//               );
//             } else {
//               return StaggeredGrid.count(
//                 crossAxisCount: 4,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 children: List.generate(6, (index) => StaggeredGridTile.count(
//                 crossAxisCellCount: 3, 
//                 mainAxisCellCount:5 , 
//                 child: Card(
//                   child: Column(
//                     ),),)
//           )
//           );
//           }}))]
//           ));
//           }}
import 'package:firestoreapi_products/fakestoreapi/controller/productController.dart';
import 'package:firestoreapi_products/fakestoreapi/screen/details/productDetails.dart';
import 'package:firestoreapi_products/fakestoreapi/screen/home/Tile/productTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductMain(),));
}
class ProductMain extends StatelessWidget {
  Product_Controller productController = Get.put(Product_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(" ---- TrenDz ----",style: GoogleFonts.sansita(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromARGB(255, 163, 24, 194),
        elevation: 5,
      ),
      body: Column(
        children: [
          Text(
            "Shop Your TrenDz",
            style:
                GoogleFonts.sansita(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Obx(() {
            if (productController.isLoading.value) {
              return Center(
              );
            } else {
              return GridView.builder(
                itemCount: productController.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                  childAspectRatio: .6),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: ()=>Get.to(Product_Details(productController.productList[index])),
                      child: ProductTile(productController.productList[index]));
                  });
            }
          }))
        ],
      ),
    );
  }
}