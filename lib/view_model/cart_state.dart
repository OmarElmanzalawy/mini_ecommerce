import 'package:mini_ecommerce/models/product_model.dart';

class CartState {

  final List<ProductModel> cartProducts;

  CartState({this.cartProducts = const []});

  CartState copyWith({
    List<ProductModel>? cartProducts,
  }){
    return CartState(
      cartProducts: cartProducts ?? this.cartProducts
    );
  }

}