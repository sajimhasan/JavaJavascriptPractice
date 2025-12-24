import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class FoodDetailPage extends StatefulWidget {
  final Map product; // Pass product data from search

  const FoodDetailPage({super.key, required this.product});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final RefreshController _refreshController = RefreshController();
  late List<String> _images; // Dynamic images
  int _currentImage = 0;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    // Replace with actual product images or use placeholder if empty
    _images = List<String>.from(widget.product['images'] ??
        [widget.product['imageUrl'] ?? "assets/images/burger1.png"]);
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
    _refreshController.refreshCompleted();
  }

  void _increaseQty() => setState(() => _quantity++);
  void _decreaseQty() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text("Added $_quantity ${widget.product['title']} item(s) to cart 🍽️")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.product['title'] ?? "Food Details",
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🍔 Image Carousel
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() => _currentImage = index);
                        },
                      ),
                      items: _images.map((img) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _images.asMap().entries.map((entry) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentImage == entry.key
                                ? Colors.orange
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 🍽️ Food Info
                Text(
                  widget.product['title'] ?? "Food Item",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.product['subtitle'] ?? "Delicious and fresh",
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 10),

                // ⭐ Rating + 💲 Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Icon(Icons.star_half, color: Colors.orange, size: 20),
                        Icon(Icons.star_border, color: Colors.orange, size: 20),
                        SizedBox(width: 6),
                        Text("(1.2K reviews)",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Text(
                      "\$${widget.product['price'] ?? '0.00'}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 📝 Description
                const Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700, height: 1.4),
                ),
                Text(
                  widget.product['description'] ??
                      "No description available.",
                  style: const TextStyle(fontSize: 15, height: 1.5),
                ),
                const SizedBox(height: 25),

                // 🍟 Quantity Selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Quantity",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _decreaseQty,
                          ),
                          Text(
                            "$_quantity",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _increaseQty,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // 🛍️ Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _addToCart,
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}