import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/utils/string_extention.dart';
import 'package:zker/features/profile_feature/presentation/theme_cubit/theme_cubit.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("theme"),
      leading: IconButton(onPressed: (){
        if(context.isDarkMode){
          BlocProvider.of<ThemeCubit>(context).toggleTheme(ThemeMode.light);
        }else{
          BlocProvider.of<ThemeCubit>(context).toggleTheme(ThemeMode.dark);
        }
      }, icon: Icon(Icons.sunny
      )),
    );
  }
}