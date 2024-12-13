import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice_code/models/product.dart';
import 'package:practice_code/ui/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 4,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, style: BorderStyle.solid),
        ),
        child: ListTile(
          leading: Image.network(product.image ?? ''),
          // leading: Image.network('https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png'),
          title: Text(product.productName ?? 'NULL'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Product code: ${product.productCode ?? 'NULL'}'),
              Text('Quantity: ${product.quantity ?? 'NULL'}'),
              Text('Price: ${product.unitPrice ?? 'NULL'}'),
              Text('Total Price: ${product.totalPrice ?? 'NULL'}'),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    UpdateProductScreen.name,
                    arguments: product,
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  _showDeleteConfirmation(context, product);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDeleteConfirmation(BuildContext context, Product product) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Product'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _deleteItem(context, product);
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> _deleteItem(BuildContext context, Product product) async {
  Uri uri = Uri.parse(
      'https://crud.teamrabbil.com/api/v1/DeleteProduct/${product.id}');
  Response response = await get(
    uri,
    headers: {'content-type': 'application/json'},
  );
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item Deleted!!'),
      ),
    );
    Navigator.pop(context);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ERROR'),
      ),
    );
  }
}
