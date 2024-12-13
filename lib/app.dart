import 'package:flutter/material.dart';
import 'package:practice_code/models/product.dart';
import 'package:practice_code/ui/screens/add_new_product_screen.dart';
import 'package:practice_code/ui/screens/products_list_screen.dart';
import 'package:practice_code/ui/screens/update_product_screen.dart';

class CURDapp extends StatelessWidget {
  const CURDapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == '/'){
          widget = const ProductsListScreen();
        } else if (settings.name == AddNewProductScreen.name){
          widget = const AddNewProductScreen();
        } else if (settings.name == UpdateProductScreen.name){
          final Product product = settings.arguments as Product;
          widget = UpdateProductScreen(product: product);
        }
        return MaterialPageRoute(
          builder: (context) {
            return widget;
          },
        );
      },
    );

  }
}
