import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/features/home_feature/presentation/views/widgets/custom_btn.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/presentation/increment_spha_cubit/increment_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/dailog_btn.dart';

class ZeroDilog extends StatelessWidget {
  const ZeroDilog({super.key, required this.spha});
final SphaEntity spha;
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
     
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Text("هل تريد تصفير العدد؟",style: TextStyle(fontSize: 20),)),
    actions:[
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
    DailogBtn(text: "الغاء", onPressed: (){
      context.pop();
    }),
    DailogBtn(text: "تصفير",onPressed: (){
      
context.read<IncrementSphaCubit>().zero(spha);
    
    },),
      ],
    ),
      
    ]   );
  }
}