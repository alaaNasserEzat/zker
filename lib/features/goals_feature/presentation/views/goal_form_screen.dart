import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/services/service_locator.dart';
import 'package:zker/core/widgets/snack_bar.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_entity.dart';
import 'package:zker/features/goals_feature/domain/entities/goal_enums.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_cubit.dart';
import 'package:zker/features/goals_feature/presentation/cubits/goals_state.dart';

class GoalFormScreen extends StatefulWidget {
  final GoalEntity? goal;

  const GoalFormScreen({super.key, this.goal});

  bool get isEditing => goal != null;

  @override
  State<GoalFormScreen> createState() => _GoalFormScreenState();
}

class _GoalFormScreenState extends State<GoalFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _targetController;

  GoalType _selectedType = GoalType.custom;
  GoalRecurrence _selectedRecurrence = GoalRecurrence.daily;

  @override
  void initState() {
    super.initState();

    final goal = widget.goal;

    _titleController = TextEditingController(text: goal?.title ?? '');

    _descriptionController = TextEditingController(
      text: goal?.description ?? '',
    );

    _targetController = TextEditingController(
      text: goal?.targetValue.toString() ?? '',
    );

    _selectedType = goal?.type ?? GoalType.custom;

    _selectedRecurrence = goal?.recurrence ?? GoalRecurrence.daily;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Goal' : 'Create Goal'),
      ),
      body: BlocListener<GoalsCubit, GoalsState>(
        listener: (context, state) {
          if (state is GoalsLoaded || state is GoalsEmpty) {
            Navigator.pop(context);
          }

          if (state is GoalsFailure) {
            showSankBar(context, state.message);
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Goal Title',
                  hintText: 'Example: Read Quran',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<GoalType>(
                value: _selectedType,
                decoration: InputDecoration(
                  labelText: 'Goal Type',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: GoalType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(_typeLabel(type)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _selectedType = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _targetController,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  labelText: 'Target Value',
                  hintText: 'Example: 10',
                  prefixIcon: Icon(Icons.track_changes),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  final target = int.tryParse(value ?? '');

                  if (target == null || target <= 0) {
                    return 'Enter a valid target';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<GoalRecurrence>(
                value: _selectedRecurrence,
                decoration: const InputDecoration(
                  labelText: 'Recurrence',
                  prefixIcon: Icon(Icons.repeat),
                ),
                items: GoalRecurrence.values.map((recurrence) {
                  return DropdownMenuItem(
                    value: recurrence,
                    child: Text(_recurrenceLabel(recurrence)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _selectedRecurrence = value;
                  });
                },
              ),

              const SizedBox(height: 32),

              BlocBuilder<GoalsCubit, GoalsState>(
                builder: (context, state) {
                  final isLoading = state is GoalsLoading;

                  return SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              _saveGoal(context);
                            },
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              widget.isEditing ? 'Update Goal' : 'Create Goal',
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveGoal(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final targetValue = int.parse(_targetController.text.trim());

    final now = DateTime.now();

    if (widget.goal == null) {
      final modelId = DateTime.now().microsecondsSinceEpoch & 0xFFFFFFFF;
      final goal = GoalEntity(
        id: "$modelId",
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        type: _selectedType,
        targetValue: targetValue,
        currentValue: 0,
        recurrence: _selectedRecurrence,
        isCompleted: false,
        createdAt: now,
        lastResetAt: now,
      );

      context.read<GoalsCubit>().addGoal(goal);
    } else {
      final updatedGoal = widget.goal!.copyWith(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        type: _selectedType,
        targetValue: targetValue,
        recurrence: _selectedRecurrence,

        // Keep the existing progress.
        isCompleted: widget.goal!.currentValue >= targetValue,
      );

      context.read<GoalsCubit>().updateGoal(updatedGoal);
    }
  }

  String _typeLabel(GoalType type) {
    switch (type) {
      case GoalType.quran:
        return 'Quran';
      case GoalType.azkar:
        return 'Azkar';
      case GoalType.tasbeeh:
        return 'Tasbeeh';
      case GoalType.prayer:
        return 'Prayer';
      case GoalType.custom:
        return 'Custom';
    }
  }

  String _recurrenceLabel(GoalRecurrence recurrence) {
    switch (recurrence) {
      case GoalRecurrence.daily:
        return 'Daily';
      case GoalRecurrence.weekly:
        return 'Weekly';
      case GoalRecurrence.monthly:
        return 'Monthly';
      case GoalRecurrence.once:
        return 'Once';
    }
  }
}
