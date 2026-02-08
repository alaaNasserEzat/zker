import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/name_of_allah_cubit/name_of_allah_cubit.dart';
import 'package:zker/features/azkar_feature/presentation/cubits/name_of_allah_cubit/name_of_allah_state.dart';

class NameOfAllahView extends StatelessWidget {
  const NameOfAllahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("اسماء الله الحسنى"),),
        body: BlocBuilder<NameOfAllahCubit, NameOfAllahState>(
        builder: (context, state) {
          if (state is NameOfAllahLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NameOfAllahError) {
            return Center(child: Text(state.message));
          }

          if (state is NameOfAllahLoaded) {
            return ListView.builder(
              itemCount: state.nameAllahList.length,
              itemBuilder: (context, index) {
                final item = state.nameAllahList[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.name),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    

    );
  }
}

