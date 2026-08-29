import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/core/constent/extensions/localelization_extention.dart';
import 'package:zker/core/widgets/custom_app_bar.dart';
import 'package:zker/core/widgets/snack_bar.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';
import 'package:zker/features/notifications/presentation/cubit/notification_cubit.dart';
import 'package:zker/features/notifications/presentation/cubit/notification_state.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: context.l10n.notificationsTitle,
        ),
        body: BlocConsumer<NotificationCubit, NotificationState>(
          // إعادة الرسم تحدث فقط إذا كانت الحالة Loaded أو Initial لضمان ثبات الواجهة
          buildWhen: (previous, current) =>
              current is NotificationLoaded || current is NotificationLoading,
          listener: (context, state) {
            if (state is NotificationError) {
              showSankBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is NotificationLoading || state is NotificationInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            final settings = state is NotificationLoaded
                ? state.settings
                : NotificationSettings.defaults();

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _NotificationSection(
                  title: context.l10n.morningAdhkarTitle,
                  subtitle: context.l10n.morningAdhkarSubtitle,
                  enabled: settings.morningAdhkarEnabled,
                  minutes: settings.morningAdhkarTimeMinutes,
                  isTimePicker: true,
                  onChanged: (val) =>
                      context.read<NotificationCubit>().toggleMorning(val),
                  onTimePicked: (minutes) =>
                      context.read<NotificationCubit>().setMorningTime(minutes),
                ),
                _NotificationSection(
                  title: context.l10n.eveningAdhkarTitle,
                  subtitle: context.l10n.eveningAdhkarSubtitle,
                  enabled: settings.eveningAdhkarEnabled,
                  minutes: settings.eveningAdhkarTimeMinutes,
                  isTimePicker: true,
                  onChanged: (val) =>
                      context.read<NotificationCubit>().toggleEvening(val),
                  onTimePicked: (minutes) =>
                      context.read<NotificationCubit>().setEveningTime(minutes),
                ),
                _NotificationSection(
                  title: context.l10n.prophetReminderTitle,
                  subtitle: context.l10n.prophetReminderSubtitle,
                  enabled: settings.prophetReminderEnabled,
                  minutes: settings.prophetReminderIntervalMinutes,
                  isTimePicker: false,
                  onChanged: (val) =>
                      context.read<NotificationCubit>().toggleProphet(val),
                  onTimePicked: (minutes) => context
                      .read<NotificationCubit>()
                      .setProphetInterval(minutes),
                ),
                _NotificationSection(
                  title: context.l10n.hourlyAdhkarTitle,
                  subtitle: context.l10n.hourlyAdhkarSubtitle,
                  enabled: settings.hourlyAdhkarEnabled,
                  minutes: settings.hourlyAdhkarIntervalMinutes,
                  isTimePicker: false,
                  onChanged: (val) =>
                      context.read<NotificationCubit>().toggleHourly(val),
                  onTimePicked: (minutes) => context
                      .read<NotificationCubit>()
                      .setHourlyInterval(minutes),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NotificationSection extends StatelessWidget {
  const _NotificationSection({
    required this.title,
    required this.subtitle,
    required this.enabled,
    required this.minutes,
    required this.isTimePicker,
    required this.onChanged,
    required this.onTimePicked,
  });

  final String title;
  final String subtitle;
  final bool enabled;
  final int minutes;
  final bool isTimePicker;
  final ValueChanged<bool> onChanged;
  final ValueChanged<int> onTimePicked;

  static const List<int> _intervals = [15, 30, 60, 120];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SwitchListTile.adaptive(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            value: enabled,
            onChanged:
                onChanged, // يعين القيمة فوراً دون جعلها null أثناء الحفظ
          ),
          if (enabled) ...[
            const Divider(height: 1, indent: 16, endIndent: 16),
            ListTile(
              leading: const Icon(Icons.schedule_rounded),
              title: Text(
                isTimePicker
                    ? _formatTime(context, minutes)
                    : _formatInterval(minutes),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
              onTap: () => isTimePicker
                  ? _pickTime(context, minutes, onTimePicked)
                  : _pickInterval(context, minutes, onTimePicked),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _pickTime(
    BuildContext context,
    int currentMinutes,
    ValueChanged<int> onPicked,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: currentMinutes ~/ 60,
        minute: currentMinutes % 60,
      ),
    );
    if (picked != null) {
      onPicked(picked.hour * 60 + picked.minute);
    }
  }

  Future<void> _pickInterval(
    BuildContext context,
    int selected,
    ValueChanged<int> onPicked,
  ) async {
    final value = await showModalBottomSheet<int>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _intervals
              .map(
                (item) => ListTile(
                  title: Text(_formatInterval(item)),
                  trailing: item == selected
                      ? Icon(
                          Icons.check_circle_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                  onTap: () => Navigator.pop(context, item),
                ),
              )
              .toList(),
        ),
      ),
    );
    if (value != null) {
      onPicked(value);
    }
  }

  String _formatTime(BuildContext context, int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    final isPm = hour >= 12;
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:${minute.toString().padLeft(2, '0')} ${isPm ? 'م' : 'ص'}';
  }

  static String _formatInterval(int minutes) {
    if (minutes < 60) return 'كل $minutes دقيقة';
    final hours = minutes ~/ 60;
    return 'كل $hours ${hours == 1 ? 'ساعة' : 'ساعات'}';
  }
}
