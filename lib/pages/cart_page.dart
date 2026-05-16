import 'package:flutter/material.dart';
import 'package:myapp/utils/cart_provider.dart';
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
    var cartList = Provider.of<CartProvider>(context).getCartList();
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingMeidum),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.paddingMeidum),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              cartList[index]['image'],
                              width: 100,
                            ),
                          ),
                          Spacing.smallX,
                          Column(
                            children: [
                              FittedBox(child: Text(cartList[index]['name'])),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(
                                      context,
                                    ).deleteItem(index);
                                  },
                                  icon: Icon(Icons.remove),
                                ),
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
          ],
        ),
      ),
    );
  }
}
