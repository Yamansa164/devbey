import 'package:devbey/core/resources/asset_manager.dart';
import 'package:devbey/core/resources/color_manager.dart';
import 'package:devbey/featuers/search/presntiation/widget/car_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/route_manger.dart';
import '../bloc/search_bloc.dart';

class CarsWidget extends StatelessWidget {
  const CarsWidget({super.key, required this.screen, required this.bloc});
  final Size screen;
  final SearchBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
          tooltip: 'Profile',
          backgroundColor: ColorManage.primery,
          child: const Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, Routes.profilePage);
          }),
        body: SafeArea(
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
              child:
                  Lottie.asset(AssetJsonManage.car, height: screen.height / 6),
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.only(top: screen.height / 20),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: screen.height / 2.2,
                    childAspectRatio: 1.2 / 2.2,
                    crossAxisSpacing: screen.height / 60,
                    mainAxisSpacing: screen.height / 60),
                itemCount: bloc.listcarsModel!.listCarModel.length,
                itemBuilder: (BuildContext ctx, index) {
                  List<String> photo =
                      bloc.listcarsModel!.listCarModel[index].photos.split(',');
                  int day = double.parse(
                    (bloc.listcarsModel!.listCarModel[index].rentalPrice /
                            bloc.listcarsModel!.listCarModel[index]
                                .rentalPricePerDay)
                        .toString(),
                  ).toInt();

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorManage.primery.withAlpha(150),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bloc.listcarsModel!.listCarModel[index].photos == ''
                            ? SizedBox(
                                height: screen.height / 5,
                                child: Image.asset(AssetImageManage.logo))
                            : SizedBox(
                                height: screen.height / 5,
                                child: const Image(
                                  image: NetworkImage(
                                      'https://test.devbey.com/api/assets?src=car/February2022/P5U15YXQJerQJO5IxFIQ.png'),
                                  // 'https://test.devbey.com/api/assets?src=${photo[0].toString().substring(2, photo[0].length - 2)}'),
                                ),
                              ),
                        Divider(
                          color: ColorManage.white,
                          height: screen.height / 50,
                          thickness: 2,
                        ),
                        Text(bloc.listcarsModel!.listCarModel[index].brandName),
                        Divider(
                          color: ColorManage.white,
                          height: screen.height / 50,
                          thickness: 2,
                        ),
                        Container(
                          height: screen.height / 20,
                          color: const Color.fromRGBO(79, 125, 156, 50),
                          child: Center(
                            child: Text(
                              'Price per day: ${bloc.listcarsModel!.listCarModel[index].rentalPricePerDay.toStringAsFixed(2)}',
                              style: TextStyle(color: ColorManage.white),
                            ),
                          ),
                        ),
                        Container(
                          height: screen.height / 20,
                          color: const Color.fromRGBO(222, 112, 33, 0.808),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Total price: ${bloc.listcarsModel!.listCarModel[index].rentalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(color: ColorManage.white),
                                ),
                              ),
                              Text('${day} Day(s):',
                                  style: TextStyle(color: ColorManage.white)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarDetailWidget(
                                          day: day.toString(),
                                          bloc: bloc,
                                          urlImage: bloc
                                                      .listcarsModel!
                                                      .listCarModel[index]
                                                      .photos ==
                                                  ''
                                              ? ''
                                              : 'https://test.devbey.com/api/assets?src=car/February2022/P5U15YXQJerQJO5IxFIQ.png',
                                          pricePerDay: bloc
                                              .listcarsModel!
                                              .listCarModel[index]
                                              .rentalPricePerDay
                                              .toStringAsFixed(2)
                                              .toString(),
                                          totalPrice: bloc.listcarsModel!
                                              .listCarModel[index].rentalPrice
                                              .toStringAsFixed(2)
                                              .toString(),
                                        )));
                          },
                          child: Container(
                            height: screen.height / 20,
                            color: ColorManage.second,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: ColorManage.white,
                                ),
                                Text('RESERVE NOW',
                                    style: TextStyle(color: ColorManage.white)),
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ]),
      ),
    ));
  }
}
