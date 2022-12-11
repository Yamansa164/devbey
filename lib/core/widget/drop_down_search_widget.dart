import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../featuers/search/presntiation/bloc/search_bloc.dart';
import '../resources/color_manager.dart';

class DropDownSearchWidget extends StatelessWidget {
  const DropDownSearchWidget({
    Key? key,
    required this.screen,
    required this.bloc,
    required this.items,
  }) : super(key: key);

  final Size screen;
  final SearchBloc bloc;
  final Map<String, String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width / 1.1,
      child: DropdownSearch(
        onChanged: (value) {
          print(value);
          bloc.setSelectedCity(value.toString());
        },
        popupProps: PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            controller: bloc.searchCity,
          ),
        ),
        items: items
            .map((id, name) {
              // print(id+'  '+name);
              return MapEntry(
                id,
                DropdownMenuItem<String>(
                  onTap: (){
                    print('object');
                    print(id);
                  },
                  value: id,
                  child: Text(name),
                ).child
              );
            })
            .values
            .toList(),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              fillColor: Colors.grey.shade300,
              filled: true,
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: ColorManage.primery,
              ),
              labelText: 'City',
              labelStyle: TextStyle(
                  color: ColorManage.primery, fontWeight: FontWeight.w500),
              errorStyle: TextStyle(
                  color: ColorManage.second, fontWeight: FontWeight.w900),
              errorBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: ColorManage.second),
              )
              ),
        ),
      ),
    );
  }
}
