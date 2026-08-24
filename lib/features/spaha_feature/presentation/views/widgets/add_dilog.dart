import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zker/core/widgets/snack_bar.dart';
import 'package:zker/features/spaha_feature/domain/entity/spha_entity.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/add_spha_cubit/add_spha_state.dart';
import 'package:zker/features/spaha_feature/presentation/get_spha_cubit/spha_cubit.dart';
import 'package:zker/features/spaha_feature/presentation/views/widgets/dailog_btn.dart';
import 'package:zker/l10n/app_localizations.dart';

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
              context.pop();
              showSankBar(
                context,
                AppLocalizations.of(context)!.addedDhikrSuccess,
              );
            } else if (state is AddSphaError) {
              showSankBar(context, state.error.message);
            }
          },
          builder: (context, state) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(
                AppLocalizations.of(context)!.addNewDhikr,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // اسم السبحة
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.dhikrName,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.writeDhikrName;
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
                        labelText: AppLocalizations.of(context)!.dhikrCount,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.writeDhikrCount;
                        }
                        if (int.tryParse(value) == null) {
                          return AppLocalizations.of(context)!.writeValidNumber;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.close),
                  onPressed: () => context.pop(),
                ),
                state is AddSphaLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        child: Text(AppLocalizations.of(context)!.add),
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
                            final newSpha = SphaEntity(
                              id: modelId,
                              name: name,
                              currentcount: 0,
                              cyclesCount: 0,
                              totalCount: 0,
                              beadsCount: count,
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
