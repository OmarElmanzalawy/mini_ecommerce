import 'package:mini_ecommerce/constants/enums.dart';
import 'package:mini_ecommerce/models/product_model.dart';

class ProductsState {
  final List<ProductModel> products;
  final List<ProductModel> menProducts;
  final List<ProductModel> womenProducts;
  final List<ProductModel> jewleryProducts;
  final List<ProductModel> electronicProducts;

  final ActiveCategory activeCategory;

  ProductsState({
    this.activeCategory = ActiveCategory.All,
    this.products = const [],
    this.menProducts = const [],
    this.womenProducts = const [],
    this.jewleryProducts = const [],
    this.electronicProducts = const [],
  });

  ProductsState copyWith({
    ActiveCategory? category,
    List<ProductModel>? products,
    List<ProductModel>? menProducts,
    List<ProductModel>? womenProducts,
    List<ProductModel>? jewleryProducts,
    List<ProductModel>? electronicProducts,

    }) {
    return ProductsState(
      products: products ?? this.products,
      menProducts: menProducts ?? this.menProducts,
      womenProducts: womenProducts ?? this.womenProducts,
      jewleryProducts: jewleryProducts ?? this.jewleryProducts,
      electronicProducts: electronicProducts ?? this.electronicProducts,
      activeCategory: category ?? this.activeCategory,
    );
  }
}
