import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  static const String name = '/add new product';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
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
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
              hintText: 'Ex: 122131',
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            visible: _addNewProductInProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addNewProduct();
                }
              },
              child: const Text('Add Product'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addNewProduct() async {
    _addNewProductInProgress = true;
    setState(() {});

    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');

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

    _addNewProductInProgress = false;
    setState(() {});

    if (response.statusCode == 200) {
      _texFieldClear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Added!!'),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Add Flied!!'),
        ),
      );
    }
  }

  void _texFieldClear() {
    _nameTEController.clear();
    _imageTEController.clear();
    _quantityTEController.clear();
    _codeTEController.clear();
    _totalPriceTEController.clear();
    _priceTEController.clear();
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
