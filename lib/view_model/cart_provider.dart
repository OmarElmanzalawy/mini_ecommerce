import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/view_model/cart_state.dart';
import 'package:mini_ecommerce/view_model/products_provider.dart';

final cartProvider = StateNotifierProvider<CartProvider,CartState>((ref) => CartProvider());

class CartProvider extends  StateNotifier<CartState> {

  CartProvider():super(CartState());

  bool addToCart(ProductModel product){
    try{ 
    final cartProducts = state.cartProducts;
    final result = [...cartProducts,product];

    state = state.copyWith(
      cartProducts: result
    );
    return true;
    }
    catch(e){
      print("Error while adding item to cart\n$e");
      return false;
    }
  }

  double calculateTotal(){
    final List<ProductModel> products = state.cartProducts;
    double sum = 0;
    if(products.isEmpty){
      return 0;
    }
    else{
      for(var product in products){
        sum += product.price;
      }
      return sum;
    }
  }

  bool removeFromCart(ProductModel product){
    try{
    final cartProducts = state.cartProducts;
    cartProducts.removeWhere((element) => product == element);

    state = state.copyWith(cartProducts: cartProducts);
    
    return true;
    }
    catch(e){
      return false;
    }
  }
}