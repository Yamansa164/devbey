import 'package:devbey/core/resources/asset_manager.dart';
import 'package:devbey/core/resources/button_widget.dart';
import 'package:devbey/core/resources/color_manager.dart';
import 'package:devbey/featuers/search/presntiation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/di.dart';

class CarDetailWidget extends StatelessWidget {
   CarDetailWidget({
    super.key,
    required this.pricePerDay,
    required this.totalPrice,
    required this.urlImage,
    required this.bloc,required this.day
  });
  final SharedPreferences pref = instance<SharedPreferences>();

  final String urlImage;
  final String day;
  final SearchBloc bloc;
  final String pricePerDay;
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double fontSize=screen.height/50;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorManage.primery,
          height: screen.height,
          width: screen.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (urlImage == '')
                Expanded(
                  child: SizedBox(
                      height: screen.height / 3,
                      child: Image.asset(AssetImageManage.logo)),
                )
              else
                Expanded(
                  child: SizedBox(
                    height: screen.height / 3,
                    width: screen.width,
                    child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://test.devbey.com/api/assets?src=car/February2022/P5U15YXQJerQJO5IxFIQ.png'),
                    ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: Container(
                  color: ColorManage.white,
                  width: screen.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(),
                      Text(
                        'Your Information',
                        style: TextStyle(
                            color: ColorManage.primery,
                            fontSize: screen.height / 30),
                      ),
                      Divider(
                        color: ColorManage.primery,
                        height: screen.height / 50,
                        thickness: 2,
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: Icon(
                          Icons.email,
                          color: ColorManage.primery,
                        ),
                        title: Text(
                          '${pref.getString('email')}',
                          style: TextStyle(color: ColorManage.primery,fontSize: fontSize),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              minLeadingWidth: 0,
                              leading: Icon(
                                Icons.emoji_emotions,
                                color: ColorManage.primery,
                              ),
                              title: Text(
                                '${pref.getString('firstName')} ',
                                style: TextStyle(color: ColorManage.primery,fontSize: fontSize),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ListTile(
                              minLeadingWidth: 0,
                              leading: Icon(
                                Icons.phone,
                                color: ColorManage.primery,
                              ),
                              title: Text(
                                ' ${pref.getString('phoneCode')} ${pref.getString('phone')}  ',
                                style: TextStyle(color: ColorManage.primery,fontSize: fontSize),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Reservation Information',
                        style: TextStyle(
                            color: ColorManage.primery,
                            fontSize: screen.height / 30),
                      ),
                      Divider(
                        color: ColorManage.primery,
                        height: screen.height / 50,
                        thickness: 2,
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: Icon(
                          Icons.arrow_back,
                          color: ColorManage.primery,
                        ),
                        title: Text(
                          'Pickup on ${bloc.dateFrom.text} In ${bloc.getSelectedCityname}',
                          style: TextStyle(color: ColorManage.primery,fontSize: fontSize),
                        ),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        leading: Icon(
                          Icons.arrow_forward,
                          color: ColorManage.primery,
                        ),
                        title: Text(
                          'Delivery on ${bloc.dateTo.text} In ${bloc.getSelectedCityname}',
                          style: TextStyle(color: ColorManage.primery,fontSize: fontSize),
                        ),
                      ),
                      Divider(
                        color: ColorManage.primery,
                        height: screen.height / 50,
                        thickness: 2,
                      ),
                      Text(
                        'Price per day: $pricePerDay US',
                        style: TextStyle(color: ColorManage.primery,fontSize: fontSize),
                      ),
                      Text(
                        'Total Price: $totalPrice US ( $day Day(s) )',
                        style: TextStyle(color: ColorManage.primery,fontSize: fontSize),
                      ),
                      SizedBox(height: screen.height/100,),
                      Center(
                        child: ButtonWidget(
                          color: ColorManage.primery,
                            screen: screen,
                            ontap: () {},
                            title: 'Confirm Reservation',
                            height: 15,
                            width: 1.5),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
