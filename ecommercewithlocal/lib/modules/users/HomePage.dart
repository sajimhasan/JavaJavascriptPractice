import 'package:ecommercewithlocal/core/controller/UserHomePageController.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'FoodDetailsPage.dart';
import 'SearchPage.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final HomepageController controller =
      Get.put(HomepageController());

  final List<Map<String, dynamic>> categories = const [
    {"name": "Burgers", "icon": Icons.fastfood},
    {"name": "Pizza", "icon": Icons.local_pizza},
    {"name": "Drinks", "icon": Icons.local_drink},
    {"name": "Dessert", "icon": Icons.icecream},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Foodie App"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.to(() => Searchpage()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 OFFERS CAROUSEL
            Obx(() {
              if (controller.isLoadingOffers.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.offers.isEmpty) {
                return const Center(child: Text("No offers available"));
              }

              return CarouselSlider.builder(
                itemCount: controller.offers.length,
                itemBuilder: (_, index, __) {
                  final offer = controller.offers[index];
                  final imageUrl =
                      offer['imageUrl'] ?? "https://picsum.photos/800/300";

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              );
            }),

            /// 🧾 CATEGORIES
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  final cat = categories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.orange[100],
                          child: Icon(cat['icon'],
                              color: Colors.orange, size: 28),
                        ),
                        const SizedBox(height: 6),
                        Text(cat['name']),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// 🍔 PRODUCTS
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Popular Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Obx(() {
              if (controller.isLoadingProducts.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.products.isEmpty) {
                return const Center(child: Text("No products available"));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.products.length,
                itemBuilder: (_, index) {
                  final product = controller.products[index];
                  final imageUrl =
                      product['imageUrl'] ?? "https://picsum.photos/200";

                  return GestureDetector(
                    onTap: () => Get.to(
                      () => FoodDetailPage(product: product),
                    ),
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(16)),
                            child: Image.network(
                              imageUrl,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['title'] ?? "No title",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "\$${product['price'] ?? 0}",
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}