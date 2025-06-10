import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/features/favorite/model_view/cubit/favorite_cubit.dart';

import '../../../core/widgets/custom_text_widget.dart';
import '../../product/view/product_view.dart';

class PortreitView extends StatelessWidget {
  const PortreitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return state is LoadingGetFavoriteState
            ? const Center(child: CircularProgressIndicator())
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FavoriteCubit.get(context).favorites.isEmpty
                    ? const Center(
                      child: CustomTextWidget(
                        text: "There is no favorites",
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    : Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await FavoriteCubit.get(context).getFavorite();
                        },
                        child: ListView.builder(
                          itemCount:
                              FavoriteCubit.get(context).favorites.length,
                          itemBuilder:
                              (context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: InkWell(
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (c) =>
                                                  ProductView(data:   FavoriteCubit.get(
                                          context,
                                        ).favorites[index]["product"]),
                                        ),
                                      ),
                                  child: ProductsItem(
                                    function: () {
                                      FavoriteCubit.get(context).addFavorite(
                                        id:
                                            FavoriteCubit.get(
                                              context,
                                            ).favorites[index]["product"]["id"],
                                      );
                                    },
                                    productName:
                                        FavoriteCubit.get(
                                          context,
                                        ).favorites[index]["product"]["name"],
                                    image:
                                        FavoriteCubit.get(
                                          context,
                                        ).favorites[index]["product"]["img"],
                                    price:
                                        FavoriteCubit.get(
                                          context,
                                        ).favorites[index]["product"]["price"],
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ),
              ],
            );
      },
    );
  }
}

class ProductsItem extends StatelessWidget {
  const ProductsItem({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
    required this.function,
  });
  final String productName;
  final String image;
  final dynamic price;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12.w, left: 10.w),
      width: 401.w,
      height: 115.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://masool.net/fruits-app/public/uploads/$image",
                  width: 57.w,
                  height: 59.h,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 22.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),

                      CustomTextWidget(
                        overflow: TextOverflow.ellipsis,
                        text: productName,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          CustomTextWidget(
                            text: "${price}KD",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff656565),
                          ),
                          SizedBox(width: 12.w),
                          const CustomTextWidget(
                            text: "14.00 KD",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffD1D1D1),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      const CustomTextWidget(
                        text: "Store Name : Store 1",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292727),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 9.w),
            child: InkWell(
              onTap: function,
              child: Container(
                width: 50.w,
                height: 50.h,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Icon(Icons.delete),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
