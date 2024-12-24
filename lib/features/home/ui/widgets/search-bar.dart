import 'package:flutter/material.dart';


class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key,
    required this.searchTEController,
  });

  final TextEditingController searchTEController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchTEController,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.zero,
          hintText: "Search",
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          )),
    );
  }
}