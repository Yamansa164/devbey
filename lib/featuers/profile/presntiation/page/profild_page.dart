import 'package:devbey/core/resources/button_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/color_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    final double fontSize = screen.height / 50;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screen.height,
            width: screen.width,
            color: ColorManage.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: screen.height / 4,
                      width: screen.width,
                      decoration: BoxDecoration(
                        color: ColorManage.primery,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(screen.width / 4)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screen.height / 7),
                        child: Image.asset(
                          AssetImageManage.logo,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screen.height / 8, left: screen.width / 3.6),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade500,
                        radius: screen.height / 9,
                        backgroundImage: NetworkImage(
                            'https://test.devbey.com/api/assets?src=car/February2022/P5U15YXQJerQJO5IxFIQ.png'),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Yaman Sakka',
                  style: TextStyle(
                      fontSize: screen.height / 30, color: ColorManage.primery),
                ),
                Text(
                  'www.sakka@gmail.com',
                  style: TextStyle(
                      fontSize: screen.height / 60, color: ColorManage.primery),
                ),
                SizedBox(
                  height: screen.height / 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: ColorManage.primery,
                      height: screen.height / 50,
                      thickness: 1,
                    ),
                    Text(
                      'Your Information',
                      style: TextStyle(
                          color: ColorManage.primery,
                          fontSize: screen.height / 30),
                    ),
                    Divider(
                      color: ColorManage.primery,
                      height: screen.height / 50,
                      thickness: 1,
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.phone,
                        color: ColorManage.primery,
                      ),
                      title: Text(
                        'Phone Number: +963951420970',
                        style: TextStyle(
                            color: ColorManage.primery, fontSize: fontSize),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.location_city,
                        color: ColorManage.primery,
                      ),
                      title: Text(
                        'Address : Damascus',
                        style: TextStyle(
                            color: ColorManage.primery, fontSize: fontSize),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.place,
                        color: ColorManage.primery,
                      ),
                      title: Text(
                        'Nationality : Damascus',
                        style: TextStyle(
                            color: ColorManage.primery, fontSize: fontSize),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.date_range,
                        color: ColorManage.primery,
                      ),
                      title: Text(
                        'BirthDate : 22-10-2001',
                        style: TextStyle(
                            color: ColorManage.primery, fontSize: fontSize),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: ColorManage.primery,
                  height: screen.height / 50,
                  thickness: 1,
                ),
                SizedBox(
                  height: screen.height / 30,
                ),
                ButtonWidget(
                    screen: screen,
                    ontap: () {},
                    title: 'Log out',
                    height: 12,
                    width: 2,
                    color: ColorManage.second)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
