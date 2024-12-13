import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice_code/models/product.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  static const String name = '/update product';

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();

  bool _updateProductInProgress = false;

  @override
  void initState() {
    super.initState();
    _nameTEController.text = widget.product.productName ?? ' ';
    _codeTEController.text = widget.product.productCode ?? ' ';
    _quantityTEController.text = widget.product.quantity ?? ' ';
    _priceTEController.text = widget.product.unitPrice ?? ' ';
    _totalPriceTEController.text = widget.product.totalPrice ?? ' ';
    _imageTEController.text = widget.product.image ?? ' ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildProductForm(),
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
      key: _formKeys,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEController,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter Product Name';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Product Name',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Ex: Iphone',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _priceTEController,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter Product Price';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Product Price',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Ex: 12310',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _quantityTEController,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter Product Quantity';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Product Quantity',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Ex: 12',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _totalPriceTEController,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter Product Total Price';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Product Total Price',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Ex: 12230310',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _codeTEController,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter Product Code';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Product Code',
              labelStyle: TextStyle(color: Colors.black),
              hintText: '#code',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),

          TextFormField(
            controller: _imageTEController,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter Product url';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Product Image URL',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Ex: example.com',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: _updateProductInProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (_formKeys.currentState!.validate()) {
                  _updateProduct();
                }
              },
              child: const Text('Update Product'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateProduct() async {
    _updateProductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}');
    Map<String, dynamic> responseBody = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _codeTEController.text.trim(),
      "ProductName": _nameTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim()
    };

    Response response = await post(
      uri,
      headers: {'content-type': 'application/json'},
      body: jsonEncode(responseBody),
    );

    _updateProductInProgress = false;
    setState(() {});

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Updated!'),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('JProduct Update Failed! try again'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _imageTEController.dispose();
    _quantityTEController.dispose();
    _codeTEController.dispose();
    _totalPriceTEController.dispose();
    _priceTEController.dispose();
    super.dispose();
  }
}
