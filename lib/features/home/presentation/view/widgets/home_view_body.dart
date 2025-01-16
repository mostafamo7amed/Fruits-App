import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/utils/widgets/custom_search_field.dart';
import 'package:fruits/features/home/presentation/view/widgets/best_selling_grid_view.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import 'best_seller_widget.dart';
import 'custom_home_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10,),
                CustomAppBar(),
                SizedBox(height: 8,),
                CustomSearchField(
                  hintText: "ابحث عن.......",
                  prefixIcon: SizedBox(
                    width: 30,
                    child: Center(
                      child: SvgPicture.asset(AssetsData.search),
                    ),
                  ),
                  suffixIcon: SizedBox(
                    width: 30,
                    child: Center(
                      child: SvgPicture.asset(AssetsData.filter),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FeaturedListView(),
                SizedBox(
                  height: 10,
                ),
                BestSellerWidget(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          BestSellingGridview(),
        ],
      ),
    );
  }
}
