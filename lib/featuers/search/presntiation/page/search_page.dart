import 'package:devbey/core/resources/button_widget.dart';
import 'package:devbey/core/resources/color_manager.dart';
import 'package:devbey/core/widget/lottie_widget.dart';

import 'package:devbey/featuers/search/presntiation/bloc/search_bloc.dart';
import 'package:devbey/featuers/search/presntiation/widget/cars_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../../core/widget/date_picker.dart';
import '../../../../core/widget/drop_down_search_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  List<String> list = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final SearchBloc bloc = SearchBloc.getBloc(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                    child: Lottie.asset(AssetJsonManage.car,
                        height: screen.height / 6),
                  ),
                ),
               
                BlocConsumer<SearchBloc, SearchState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      bloc.add(GetCitiesEvent());
                    } else if (state is LoadingState) {
                      return LottieWidget(
                          text: 'Loading',
                          lottie: AssetJsonManage.loading,
                          onPressed: () {},
                          screen: screen);
                    }
                     else if (state is GetCitiesSuccess) {
                     
                      return Padding(
                        padding:  EdgeInsets.only(top:screen.height/7),
                        child: Column(
                          children: [
                            DatePickerWidget(
                              screen: screen,
                              controller: bloc.dateFrom,
                              title: 'Date From',
                            ),
                            SizedBox(
                              height: screen.height / 20,
                            ),
                            DatePickerWidget(
                              screen: screen,
                              controller: bloc.dateTo,
                              title: 'Date To',
                            ),
                            SizedBox(
                              height: screen.height / 20,
                            ),
                            DropDownSearchWidget(
                              screen: screen,
                              bloc: bloc,
                              items: Map.fromIterables(
                                  state.citiesModel.citiesModel
                                      .map((e) => e.id.toString()),
                                  state.citiesModel.citiesModel
                                      .map((e) => e.name)),
                            ),
                            SizedBox(
                              height: screen.height / 20,
                            ),
                            ButtonWidget(
                                screen: screen,
                                ontap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print(bloc.dateFrom.text);
                                    print(bloc.dateTo.text);
                                    print(bloc.getSelectedCity);
                                  }
                                  bloc.add(GetCarsEvent());
                                },
                                title: 'Find Car',
                                height: 12,
                                width: 2)
                          ],
                        ),
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
                    } else if (state is GetCarsSuccess) {
                      return  CarsWidget(screen: screen,bloc:bloc);
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
      ),
    );
  }
}
