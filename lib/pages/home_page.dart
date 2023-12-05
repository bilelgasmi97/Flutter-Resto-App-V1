import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:restau_app/component/grocery_item.dart';
import 'package:restau_app/model/cart_model.dart';
import 'package:restau_app/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          )),
          backgroundColor: Colors.black,
          child: Icon(Icons.shopping_bag),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Good Morning",
                      ),
                      Text(
                        "Let's order fresh items for you",
                        style: TextStyle(fontSize: 35),
                      ),
                      Divider(),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Fresh item"),
                    ],
                  )),
              Expanded(child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return GroceryItem(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        itemPath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemsToCart(index);
                        },
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ));
  }
}
