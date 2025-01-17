import 'package:mini_ecommerce/models/product_model.dart';

class ProductsState {

  final List<ProductModel> products;

  ProductsState({this.products = const []});

  ProductsState copyWith({
    List<ProductModel>? products,
  }){
    return ProductsState(
      products: products ?? this.products
    );
  }

}