import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../../components/app_box_shadow.dart';
import '../../../components/button/app_elevated_button.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    super.key,
    this.minute,
    required this.totalPrice,
  });

  final int? minute;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: AppBoxShadow.boxShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Delivery Time',
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
              const Spacer(),
              Image.asset(Assets.images.timeIcon.path, width: 22.0),
              Text(
                ' ${minute ?? '-:-'} mins',
                style: const TextStyle(
                    color: Colors.brown, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          const Row(
            children: [
              Text(
                'Total Price',
                style: TextStyle(color: Colors.brown, fontSize: 16.0),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Text(
                '\$ ',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                totalPrice.toStringAsFixed(2),
                style: const TextStyle(color: Colors.brown, fontSize: 24.0),
              ),
              const Spacer(),
              AppElevatedButton.small(
                onPressed: () {},
                text: 'Place Order',
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
