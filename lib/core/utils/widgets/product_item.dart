
import 'package:flutter/material.dart';

import '../app_manager/app_assets.dart';
import '../app_manager/app_colors.dart';
import '../app_manager/app_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightGrayColor.withValues(alpha: .11),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 10,
            child: Icon(
              Icons.favorite_border_outlined,
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Image.asset(
                  AssetsData.testImage,
                  fit: BoxFit.fill,
                ),
                ListTile(
                  minLeadingWidth: 0,
                  horizontalTitleGap: 3,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  title: Text(
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    'فرولة',
                    style: Styles.semiBold13,
                  ),
                  subtitle: Text.rich(
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      text: '100 جنيه',
                      style: Styles.bold13.copyWith(color: AppColor.yellowColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' / ',
                          style: Styles.bold13
                              .copyWith(color: AppColor.yellowColor.withValues(alpha: .6)),
                        ),
                        TextSpan(
                          text: 'كيلو',
                          style: Styles.bold13
                              .copyWith(color: AppColor.yellowColor.withValues(alpha: .6)),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.primaryColor,
                    child: Icon(
                      Icons.add,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
