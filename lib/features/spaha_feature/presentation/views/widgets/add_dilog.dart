import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/spaha_feature/data/models/spha_model.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_state.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/dailog_btn.dart';


void showAddSphaDialog(BuildContext context) {
  final nameController = TextEditingController();
  final countController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (_) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<AddSphaCubit>()),
          BlocProvider.value(value: context.read<SphaCubit>()),
        ],
        child: BlocConsumer<AddSphaCubit, AddSphaState>(
          listener: (context, state) {
            if (state is AddSphaSuccess) {
              // نحدث الـ List فورًا
              context.read<SphaCubit>().getSpha();

       

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تمت إضافة السبحة بنجاح!')),
              );
          
            } else if (state is AddSphaError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error.message)));
            }
          },
          builder: (context, state) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                "إضافة زكر جديد",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              content: Form(
                key: formKey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // اسم السبحة
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "اسم الزكر",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "اكتب اسم الزكر";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      // العدد
                      TextFormField(
                        controller: countController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "العدد",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "اكتب العدد";
                          }
                          if (int.tryParse(value) == null) {
                            return "اكتب رقم صحيح";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                DailogBtn(
                  text: "اغلاق",
                  onPressed: () => Navigator.pop(context),
                ),
                state is AddSphaLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CircularProgressIndicator(),
                      )
                    : DailogBtn(
                        text: "اضافه",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final name = nameController.text.trim();
                            final count = int.parse(
                              countController.text.trim(),
                            );
                            final modelId =
                                DateTime.now().microsecondsSinceEpoch &
                                0xFFFFFFFF;

                            // إنشاء كيان السبحة
                            final newSpha = SphaModel(
                              modelId: modelId,
                              modelName: name,
                              modelCurrentcount: count,
                              modelCyclesCount: 0,
                              modelTotalCount: 0,
                            );
                            // استدعاء Cubit لإضافة السبحة
                            await context.read<AddSphaCubit>().addSpha(newSpha);
                          }
                        },
                      ),
              ],
            );
          },
        ),
      );
    },
  );
}
