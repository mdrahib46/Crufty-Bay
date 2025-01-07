import 'package:flutter/material.dart';

class CreateProductReviewScreen extends StatefulWidget {
  const CreateProductReviewScreen({super.key});

  static const String name = '/product/create-product-review';

  @override
  State<CreateProductReviewScreen> createState() =>
      _CreateProductReviewScreenState();
}

class _CreateProductReviewScreenState extends State<CreateProductReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {});
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 48),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _reviewTEController,
                  maxLines: 7,
                  decoration: const InputDecoration(hintText: 'Write review'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
