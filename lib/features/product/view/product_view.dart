import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/features/basket/model_view/cubit/cart_cubit.dart';
import 'package:task_one/features/favorite/model_view/cubit/favorite_cubit.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../favorite/model/repos/fav_repo_imp.dart';
import 'product_landscape_view.dart';
import 'product_portreit_view.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.data});
  final Map data;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(getIt<FavRepoImp>() , CartCubit())..getFavorite(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          // TODO: implement listener
          for (var element in FavoriteCubit.get(context).favorites) {
            if (element["favo_id"] == widget.data["id"]) {
              color = Colors.red;
              break;
            } else {
              color = Colors.grey;
            }
          }
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              centerTitle: true,
              title: CustomTextWidget(
                text: widget.data["name"],
                fontSize:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 24
                        : 15,
                fontWeight: FontWeight.bold,
                color: const Color(0xff204F38),
              ),

              actions: [
                IconButton(
                  onPressed: () {
                    FavoriteCubit.get(
                      context,
                    ).addFavorite(id: widget.data["id"]);
                  },
                  icon: Icon(Icons.favorite, size: 27, color: color),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share_outlined, size: 27),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: SingleChildScrollView(
                child:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? PortreitView(data: widget.data)
                        : const LandScapeView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
