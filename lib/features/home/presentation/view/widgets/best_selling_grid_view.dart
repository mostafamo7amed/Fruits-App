import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/product_item.dart';

class BestSellingGridview extends StatelessWidget {
  const BestSellingGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 3,
      itemBuilder: (context, index) => ProductItem(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 163/214,
            mainAxisSpacing: 8,
            crossAxisSpacing: 10
          ),
    );
  }
}
