import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../custom_image_view.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

class ItemLoadingWidget {
  ItemLoadingWidget._();

  static final ItemLoadingWidget _instance = ItemLoadingWidget._();

  static ItemLoadingWidget get instance => _instance;

  Widget itemListCourse() {
    return
      Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.black12.withOpacity(0.1),
      child: SizedBox(
        height: getVerticalSize(64),
        child: Row(
          children: [
            CustomImageView(
              width: getHorizontalSize(115),
              height: getVerticalSize(63),
              fit: BoxFit.cover,
              imagePath: ImageConstant.imgThietkedohoaso,
            ),
            SizedBox(
              width: getHorizontalSize(12),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: getVerticalSize(30),
                    color: Colors.black,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        height: getVerticalSize(20),
                        svgPath: ImageConstant.imgVipOnly,
                      ),
                      const Spacer(),
                      CustomImageView(
                          width: getSize(15),
                          height: getSize(15),
                          svgPath: ImageConstant.imgAwardBlueGray900,
                          margin: getMargin(left: 46, top: 1, bottom: 4)),
                      Padding(
                          padding: getPadding(left: 4, top: 1),
                          child: Text("khoá học",
                              style: theme.textTheme.bodySmall)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemCurriculum( ) {
    return SizedBox(
      width: double.maxFinite,
      height: getVerticalSize(63),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.white.withOpacity(0.2),
            highlightColor: Colors.black12.withOpacity(0.1),
            child: CustomImageView(
              height: getVerticalSize(63),
              width: getHorizontalSize(115),
              fit: BoxFit.cover,
              imagePath: ImageConstant.imgThietkedohoaso10,
            ),
          ),
          SizedBox(
            width: getHorizontalSize(5),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.2),
                    highlightColor: Colors.black12.withOpacity(0.1),
                    child: Container(color: Colors.blue,height: getVerticalSize(16),)),
                SizedBox(height: getVerticalSize(5),),
                Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.black12.withOpacity(0.1),
                  child: Row(
                    children: [
                      CustomImageView(
                        margin: getMargin(right: 5),
                        width: getSize(12),
                        height: getSize(12),
                        svgPath: ImageConstant.imgCalendar,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,height: getVerticalSize(12),),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(5),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.black12.withOpacity(0.1),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          height: getVerticalSize(1),
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(5),
                ),

                Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.black12.withOpacity(0.1),
                  child: Container(
                    height: getVerticalSize(16),
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget itemListMyCourse() {
    return SizedBox(
      width: double.maxFinite,
      height: getVerticalSize(63),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.white.withOpacity(0.2),
            highlightColor: Colors.black12.withOpacity(0.1),
            child: CustomImageView(
              height: getVerticalSize(63),
              width: getHorizontalSize(115),
              imagePath: ImageConstant.imgThietkedohoaso26,
            ),
          ),
          SizedBox(
            width: getHorizontalSize(5),
          ),
          Expanded(
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.black12.withOpacity(0.1),
                  child: Container(
                    alignment: Alignment.center,
                    height: getVerticalSize(14),
                    margin: getMargin(
                      top: 2,
                      bottom: 4,
                    ),
                    padding: getPadding(
                      left: 7,
                      right: 7,
                    ),
                    decoration: AppDecoration.fillPrimary,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.black12.withOpacity(0.1),
                  child: Row(
                    children: [
                      CustomImageView(
                        margin: getMargin(right: 5),
                        width: getSize(12),
                        height: getSize(12),
                        svgPath: ImageConstant.imgCalendar,
                      ),
                      Container(width: getHorizontalSize(100),color: Colors.black,height: 12,),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(5),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.black12.withOpacity(0.1),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          height: getVerticalSize(1),
                          color: Colors.yellow,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: getVerticalSize(1),
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(5),
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.white.withOpacity(0.2),
                      highlightColor: Colors.black12.withOpacity(0.1),
                      child: Text(
                        '100%',
                        style: TextStyle(fontSize: getFontSize(12)),
                      ),
                    ),
                    SizedBox(
                      width: getHorizontalSize(10),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white.withOpacity(0.2),
                      highlightColor: Colors.black12.withOpacity(0.1),
                      child: Container(
                        width: getHorizontalSize(0.5),
                        height: getHorizontalSize(15),
                        color: Colors.black54.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(
                      width: getHorizontalSize(10),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white.withOpacity(0.2),
                      highlightColor: Colors.black12.withOpacity(0.1),
                      child: Text(
                        '12/12 bài học',
                        style: TextStyle(
                          fontSize: getFontSize(12),
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget itemBlockCourse() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.black12.withOpacity(0.1),
          child: CustomImageView(
            imagePath: ImageConstant.img077860x6151,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          bottom: 1,
          left: 1,
          right: 1,
          child: Container(
            width: double.maxFinite,
            height: getVerticalSize(410),
            decoration: AppDecoration.gradientBlackToBlack,
            child: Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(0.2),
              highlightColor: Colors.black12.withOpacity(0.1),
              child: Container(
                width: double.maxFinite,
                padding: getPadding(bottom: 14, right: 12, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      color: Colors.black,
                      width: double.maxFinite,
                      height: getVerticalSize(22),
                    ),
                    CustomImageView(
                      height: getVerticalSize(27),
                      margin: getMargin(top: 5, bottom: 5),
                      svgPath: "assets/images/img_only_vip.svg",
                    ),
                    Padding(
                      padding: getPadding(
                        top: 21,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgAward,
                            height: getSize(16),
                            width: getSize(16),
                            margin: getMargin(
                              bottom: 3,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 5,
                            ),
                            child: Text(
                              "Lộ trình",
                              style: CustomTextStyles.bodyLargeGray10002,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: getPadding(
                              left: 12,
                            ),
                            child: Text(
                              "Khóa học >",
                              style: CustomTextStyles.bodyLargeGray10002,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgTicket,
                          height: getVerticalSize(22),
                          width: getHorizontalSize(67),
                        ),
                        const Spacer(),
                        Text(
                          "-",
                          style: CustomTextStyles.bodyLargeGray10002,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 2,
                          ),
                          child: Text(
                            "(- - - -)",
                            style: CustomTextStyles.bodyLargeGray10002,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgClockGray10002,
                            height: getSize(16),
                            width: getSize(16),
                            margin: getMargin(
                              top: 1,
                              bottom: 3,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 5,
                              bottom: 2,
                            ),
                            child: Text(
                              "Nâng cao",
                              style: CustomTextStyles.bodyLargeGray10002,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: getPadding(
                              top: 1,
                            ),
                            child: Text(
                              "0 - 0 tháng",
                              style: CustomTextStyles.bodyLargeGray10002,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget itemComboDiscover() {
    return
      Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.black12.withOpacity(0.1),
      child: Center(
        child: Container(
          width: getHorizontalSize(300),
          height: getHorizontalSize(290),
          color: Colors.black,
        ),
      ),
    );
  }
}
