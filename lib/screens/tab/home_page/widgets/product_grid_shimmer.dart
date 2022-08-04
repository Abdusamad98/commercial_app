import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsGridShimmer extends StatelessWidget {
  const ProductsGridShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 20,
        shrinkWrap: true,
        crossAxisSpacing: 15,
        children: List.generate(
          10,
          (index) => Shimmer.fromColors(
            direction: ShimmerDirection.ttb,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
