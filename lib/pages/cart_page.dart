import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/app_dialog.dart';
import 'cart/widget/delivery_time.dart';
import 'cart/widget/food_item.dart';
import '../components/appBar/foodie_app_bar.dart';
import '../models/food_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    double total = 0.0;
    for (FoodModel food in foods) {
      total = total + food.total;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
          // leftPressed: () =>
          //     SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          // color: Colors.yellow.withOpacity(0.6),
          leftPressed: () => AppDialog.dialog(
                context,
                title: '😢',
                content: 'Do you want to exit app ?',
                action: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              ),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.brown.withOpacity(0.8),
          ),
          title: 'Foodies'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 12.0, bottom: 30.0),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return FoodItem(
                    food,
                    onAdd: () => setState(
                        () => food.quantity = (food.quantity ?? 0) + 1),
                    onRemove: food.quantity == 1
                        ? null
                        : () => setState(
                            () => food.quantity = (food.quantity ?? 0) - 1),
                    onDelete: () => AppDialog.dialog(
                      context,
                      title: '😐',
                      content: 'Delete this food?',
                      action: () => setState(
                          () => foods.removeWhere((e) => e.id == food.id)),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemCount: foods.length,
              ),
              const SizedBox(height: 56.0),
              DeliveryTime(minute: 25, totalPrice: totalPrice),
            ],
          ),
        ),
      ),
    );
  }
}
