import 'package:firestoreapi_products/fakestoreapi/controller/productController.dart';
import 'package:firestoreapi_products/fakestoreapi/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class Product_Details extends StatelessWidget {
  ProductModel product;
  Product_Details(this.product);

  Product_Controller controller = Get.find<Product_Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TrenDz DetailZ",
        style: GoogleFonts.sansita(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 163, 24, 194),
        elevation: 5,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 400,
              width: double.infinity,
              decoration:
              BoxDecoration(image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image!))),
            ),
          ),
          const SizedBox(height: 10,),
          Text(product.title!,
            style: GoogleFonts.galada(
                fontWeight: FontWeight.bold,fontSize: 20
            ),),
          const SizedBox(height: 10,),
          Text(product.description!,
            style: GoogleFonts.sansita(
                fontWeight: FontWeight.bold,fontSize: 15
            ),),
          const SizedBox(height: 7,),
          Text('\$${product.price!}',
            style: GoogleFonts.fahkwang(
                fontStyle: FontStyle.italic,fontSize: 15
            ),),
          const SizedBox(height: 7,),
          Text('⭐⭐⭐${product.rating?.rate} ',
            style: GoogleFonts.sansita(
                fontWeight: FontWeight.bold,fontSize: 15
            ),)
        ],
      ),
    );
  }
}