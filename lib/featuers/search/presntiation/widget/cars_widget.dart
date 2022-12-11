import 'package:devbey/core/resources/asset_manager.dart';
import 'package:devbey/core/resources/button_widget.dart';
import 'package:devbey/core/resources/color_manager.dart';
import 'package:devbey/core/resources/route_manger.dart';
import 'package:devbey/featuers/search/presntiation/widget/car_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bloc/search_bloc.dart';

class CarsWidget extends StatelessWidget {
  const CarsWidget({super.key, required this.screen, required this.bloc});
  final Size screen;
  final SearchBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                        Text(
                            '${double.parse(
                              (bloc.listcarsModel!.listCarModel[index]
                                          .rentalPrice /
                                      bloc.listcarsModel!.listCarModel[index]
                                          .rentalPricePerDay)
                                  .toString(),
                            ).toInt()} Day(s):',
                            style: TextStyle(color: ColorManage.white)),
                      ],
                    ),
                  ),
                  // SizedBox(height: screen.height/30,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarDetailWidget()));
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
    );
  }
}
