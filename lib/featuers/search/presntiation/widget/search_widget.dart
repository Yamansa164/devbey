import 'package:flutter/material.dart';

import '../../../../core/resources/button_widget.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widget/date_picker.dart';
import '../../../../core/widget/drop_down_search_widget.dart';
import '../bloc/search_bloc.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key? key,
    required this.screen,
    required this.bloc,
    required this.state,
  }) : super(key: key);

  final Size screen;
  final SearchBloc bloc;
  final GetCitiesSuccess state;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(top: screen.height / 7),
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
                  state.citiesModel.citiesModel.map((e) => e.id.toString()),
                  state.citiesModel.citiesModel.map((e) => e.name)),
            ),
            SizedBox(
              height: screen.height / 20,
            ),
            ButtonWidget(
                color: ColorManage.primery,
                screen: screen,
                ontap: () async {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(GetCarsEvent());
                  }
                },
                title: 'Find Car',
                height: 12,
                width: 2)
          ],
        ),
      ),
    );
  }
}
