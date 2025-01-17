import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/constants/enums.dart';
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

    print('PROVIDER MAPPED LIST $productModelsList');

    state = state.copyWith(
      products: productModelsList
    );
    print("PRODUCTS UPDATED");
    print('PROVIDER MAPPED LIST ${state.products}');
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

  void categorizeProducts(){

  List<ProductModel>  menProducts = [];
  List<ProductModel>  womenProducts = [];
  List<ProductModel>  jewleryProducts = [];
  List<ProductModel> electronics = [];

  

  for(var product in state.products){
    switch (product.category) {
      case "men's clothing":
        menProducts.add(product);
        break;
      case "women's clothing":
      womenProducts.add(product);
      break;
      case "jewelery":
      jewleryProducts.add(product);
      break;
      case "electronics":
      electronics.add(product);
    }
  }

  state = state.copyWith(
    menProducts: menProducts,
    womenProducts: womenProducts,
    jewleryProducts: jewleryProducts,
    electronicProducts: electronics,
  );

  }

  void changeCategory(ActiveCategory newCategory){
    state = state.copyWith(
      category: newCategory
    );
  }

  List<ProductModel> mapCategoryToList(){
    switch (state.activeCategory) {
      case ActiveCategory.All:
          return state.products;
      case ActiveCategory.Men:
        return state.menProducts;
      case ActiveCategory.Women:
        return state.womenProducts;
      case ActiveCategory.Jewlery:
        return state.jewleryProducts;
      case ActiveCategory.Electronics:
        return state.electronicProducts;
    }
  }

  
}