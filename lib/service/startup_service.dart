import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/view_model/products_provider.dart';

class StartupService {
    

Future loadLocalData(WidgetRef ref)async{
  Future.microtask(()async{
  print('microtasking');
  //await ref.read(tasksProvider.notifier).clearTasks();
  await ref.read(productsProvider.notifier).fetchProducts();
  });

}
}