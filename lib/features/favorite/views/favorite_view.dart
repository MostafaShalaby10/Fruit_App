import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/features/basket/model_view/cubit/cart_cubit.dart';
import 'package:task_one/features/favorite/model_view/cubit/favorite_cubit.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../model/repos/fav_repo_imp.dart';
import 'favorite_landscape_view.dart';
import 'favorite_portreit_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return BlocProvider(
      create: (context) => FavoriteCubit(getIt<FavRepoImp>() , CartCubit())..getFavorite(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          centerTitle: true,
          title: CustomTextWidget(
            text: "Favorite",
            fontSize:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 24
                    : 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xff204F38),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 25.w : 18.w,
            vertical: 20.h,
          ),

          child: isLandscape ? const LandScapeView() : const PortreitView(),
        ),
      ),
    );
  }
}
