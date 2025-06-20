import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/core/utils/service_locator.dart';
import 'package:task_one/features/basket/model/repos/bassket_repo_imp.dart';
import 'package:task_one/features/basket/model_view/cubit/cart_cubit.dart';
import '../../../core/widgets/custom_text_widget.dart';
import 'basket_landscape_view.dart';
import 'basket_portreit_view.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt<BassketRepoImp>())..getCart(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          centerTitle: true,
          title: CustomTextWidget(
            text: "Basket",
            fontSize:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 24
                    : 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xff204F38),
          ),
        ),

        resizeToAvoidBottomInset: false,
        body:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const PortreitView()
                : const LandScapeView(),
      ),
    );
  }
}
