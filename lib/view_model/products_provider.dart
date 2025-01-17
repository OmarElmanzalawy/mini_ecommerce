import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/service/api_service.dart';
import 'package:mini_ecommerce/service/init_get_it.dart';
import 'package:mini_ecommerce/view_model/products_state.dart';

final productsProvider = StateNotifierProvider<ProductsProvider,ProductsState>((ref) => ProductsProvider());

class ProductsProvider extends StateNotifier<ProductsState>{
  ProductsProvider():super(ProductsState());

  Future<void> fetchProducts()async{

  try{

  final products = await getIt<ApiService>().loadAllCategories();

  if(products != null){

   final List<ProductModel> productModelsList =  products.map((product) => 
      ProductModel.fromJson(product)
    ).toList();

    state.copyWith(
      products: productModelsList
    );
    print("PRODUCTS UPDATED");
  }
  else{
    //TODO DISPLAY SOME FEEDBACK TO USER
    print('error happened while fetching products in provider');
  }
  }
  catch(e){
    print("ERROR: $e");
    throw e;
  }

  }

  
}