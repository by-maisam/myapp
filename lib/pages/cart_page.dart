import 'package:flutter/material.dart';
import 'package:myapp/utils/cart_provider.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/dimensions.dart';
import 'package:myapp/utils/spacing.dart';
import 'package:myapp/widgets/myappbar.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Watch the cart provider for automatic UI rebuilds
    final cartProvider = Provider.of<CartProvider>(context);
    final cartList = cartProvider.getCartList();

    return Scaffold(
      appBar: const MyAppBar(),
      body: cartList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_basket_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  Spacing.mediumY,
                  Text(
                    "Your bucket is empty",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.all(Dimensions.paddingMeidum),
              child: Column(
                children: [
                  // 1. List of Cart Items
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        final item = cartList[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(Dimensions.paddingSmall),
                            child: Row(
                              children: [
                                // Product Image Container
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Spacing.mediumX,

                                // Product Title and Subtotal Detail Section
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name']!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Rs. ${item['price']}",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Quantity Control Selector Component Row
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          cartProvider.decrementQuantity(index),
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        size: 22,
                                      ),
                                      color: Colors.grey[700],
                                    ),
                                    Text(
                                      "${item['quantity']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          cartProvider.incrementQuantity(index),
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        size: 22,
                                      ),
                                      color: AppColors.brandcolor,
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          cartProvider.deleteItem(index),
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        size: 22,
                                      ),
                                      color: Colors.red[400],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // 2. Sticky Checkout Total Breakdown Card Banner
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total Amount",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Rs. ${cartProvider.getCartTotal().toStringAsFixed(0)}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.brandcolor,
                                ),
                              ),
                            ],
                          ),
                          Spacing.mediumY,
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: FilledButton(
                              onPressed: () {
                                // Implement checkout gateway action routing here
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.brandcolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "PROCEED TO CHECKOUT",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
