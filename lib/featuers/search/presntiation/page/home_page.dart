import 'package:devbey/core/resources/color_manager.dart';
import 'package:devbey/core/resources/route_manger.dart';
import 'package:devbey/core/widget/lottie_widget.dart';

import 'package:devbey/featuers/search/presntiation/bloc/search_bloc.dart';
import 'package:devbey/featuers/search/presntiation/widget/cars_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/asset_manager.dart';
import '../widget/search_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final SearchBloc bloc = SearchBloc.getBloc(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          tooltip: 'Profile',
          backgroundColor: ColorManage.primery,
          child: const Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, Routes.profilePage);
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screen.height,
            width: screen.width,
            color: ColorManage.white,
            child: Column(children: [
              Container(
                height: screen.height / 5,
                width: screen.width,
                decoration: BoxDecoration(
                  color: ColorManage.primery,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(screen.width / 4)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screen.height / 35),
                  child: Lottie.asset(AssetJsonManage.search,
                      height: screen.height / 6),
                ),
              ),
              BlocConsumer<SearchBloc, SearchState>(
                listener: (context, state) {
                  if (state is GetCarsSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CarsWidget(screen: screen, bloc: bloc)));
                    bloc.add(GetCitiesEvent());
                  }
                },
                builder: (context, state) {
                  if (state is SearchInitial) {
                    bloc.add(GetCitiesEvent());
                  } else if (state is LoadingState) {
                    return LottieWidget(
                        text: 'Loading',
                        lottie: AssetJsonManage.loading,
                        onPressed: () {},
                        screen: screen);
                  } else if (state is GetCitiesSuccess) {
                    return SearchWidget(
                      screen: screen,
                      bloc: bloc,
                      state: state,
                    );
                  } else if (state is GetCitiesFaield) {
                    return LottieWidget(
                        text: state.failuer.message,
                        lottie: AssetJsonManage.error,
                        onPressed: () {
                          bloc.add(GetCitiesEvent());
                        },
                        buttonName: 'retry',
                        screen: screen);
                  } else if (state is GetCarsFaield) {
                    return LottieWidget(
                        text: state.failuer.message,
                        lottie: AssetJsonManage.error,
                        onPressed: () {
                          bloc.add(GetCitiesEvent());
                        },
                        buttonName: 'Try again',
                        screen: screen);
                  }
                  return LottieWidget(
                      text: 'SomeThing Wrong happen',
                      lottie: AssetJsonManage.error,
                      onPressed: () {
                        bloc.add(GetCitiesEvent());
                      },
                      screen: screen);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
