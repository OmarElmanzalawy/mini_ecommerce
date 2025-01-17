import 'package:dio/dio.dart';

class ApiService {

  Future<List<Map<String,dynamic>>?> loadAllCategories()async{

  final String url = 'https://fakestoreapi.com/products';

  Dio dio = Dio();

  final response = await dio.get(url);

  if(response.statusCode == 200){
    print("Success");
    // print(response.data);
    final List<dynamic> lst = response.data;
    return lst.cast<Map<String,dynamic>>();

  }

  else{
    print("Failure");
    print(response);
    return null;
  }

 }

}