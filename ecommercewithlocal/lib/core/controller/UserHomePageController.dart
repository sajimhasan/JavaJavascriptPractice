import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomepageController extends GetxController {
  var isLoadingOffers = true.obs;
  var isLoadingProducts = true.obs;

  var offers = <dynamic>[].obs;
  var products = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOffers();
    fetchProducts();
  }

  Future<void> fetchOffers() async {
    try {
      final response =
          await http.get(Uri.parse("https://e-commerce-back-end-1-juw4.onrender.com/api/offers/all"));

      if (response.statusCode == 200) {
        offers.value = jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint("Offer error: $e");
    } finally {
      isLoadingOffers.value = false;
    }
  }

  Future<void> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse("https://e-commerce-back-end-1-juw4.onrender.com/api/products/list"));

      if (response.statusCode == 200) {
        products.value = jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint("Product error: $e");
    } finally {
      isLoadingProducts.value = false;
    }
  }
}