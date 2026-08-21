import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/features/notifications/domain/entities/notification_settings.dart';
import 'package:zker/features/notifications/presentation/cubit/notification_cubit.dart';
import 'package:zker/features/notifications/presentation/cubit/notification_state.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static const intervals = [15, 30, 60, 120];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('الإشعارات')),
        body: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            if (state is NotificationError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is NotificationLoading || state is NotificationInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            final settings = state is NotificationLoaded
                ? state.settings
                : state is NotificationUpdating
                ? state.settings
                : NotificationSettings.defaults();
            final updating = state is NotificationUpdating;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _NotificationSection(
                  title: 'أذكار الصباح',
                  subtitle: 'تذكير يومي بأذكار الصباح',
                  enabled: settings.morningAdhkarEnabled,
                  onChanged: updating
                      ? null
                      : context.read<NotificationCubit>().toggleMorning,
                  detail: _timeLabel(settings.morningAdhkarTimeMinutes),
                  onDetailTap: updating
                      ? null
                      : () => _pickTime(
                          context,
                          settings.morningAdhkarTimeMinutes,
                          context.read<NotificationCubit>().setMorningTime,
                        ),
                ),
                _NotificationSection(
                  title: 'أذكار المساء',
                  subtitle: 'تذكير يومي بأذكار المساء',
                  enabled: settings.eveningAdhkarEnabled,
                  onChanged: updating
                      ? null
                      : context.read<NotificationCubit>().toggleEvening,
                  detail: _timeLabel(settings.eveningAdhkarTimeMinutes),
                  onDetailTap: updating
                      ? null
                      : () => _pickTime(
                          context,
                          settings.eveningAdhkarTimeMinutes,
                          context.read<NotificationCubit>().setEveningTime,
                        ),
                ),
                _NotificationSection(
                  title: 'الصلاة على النبي ﷺ',
                  subtitle: 'تذكير بالصلاة على النبي',
                  enabled: settings.prophetReminderEnabled,
                  onChanged: updating
                      ? null
                      : context.read<NotificationCubit>().toggleProphet,
                  detail: _intervalLabel(
                    settings.prophetReminderIntervalMinutes,
                  ),
                  onDetailTap: updating
                      ? null
                      : () => _pickInterval(
                          context,
                          settings.prophetReminderIntervalMinutes,
                          context.read<NotificationCubit>().setProphetInterval,
                        ),
                ),
                _NotificationSection(
                  title: 'أذكار كل ساعة',
                  subtitle: 'تذكير بالذكر كل فترة',
                  enabled: settings.hourlyAdhkarEnabled,
                  onChanged: updating
                      ? null
                      : context.read<NotificationCubit>().toggleHourly,
                  detail: _intervalLabel(settings.hourlyAdhkarIntervalMinutes),
                  onDetailTap: updating
                      ? null
                      : () => _pickInterval(
                          context,
                          settings.hourlyAdhkarIntervalMinutes,
                          context.read<NotificationCubit>().setHourlyInterval,
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _pickTime(
    BuildContext context,
    int minutes,
    ValueChanged<int> onPicked,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60),
    );
    if (picked != null) onPicked(picked.hour * 60 + picked.minute);
  }

  Future<void> _pickInterval(
    BuildContext context,
    int selected,
    ValueChanged<int> onPicked,
  ) async {
    final value = await showModalBottomSheet<int>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: intervals
              .map(
                (minutes) => ListTile(
                  title: Text(_intervalLabel(minutes)),
                  trailing: minutes == selected
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => Navigator.pop(context, minutes),
                ),
              )
              .toList(),
        ),
      ),
    );
    if (value != null) onPicked(value);
  }

  static String _timeLabel(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    final isPm = hour >= 12;
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:${minute.toString().padLeft(2, '0')} ${isPm ? 'م' : 'ص'}';
  }

  static String _intervalLabel(int minutes) {
    if (minutes < 60) return 'كل $minutes دقيقة';
    final hours = minutes ~/ 60;
    return 'كل $hours ${hours == 1 ? 'ساعة' : 'ساعات'}';
  }
}

class _NotificationSection extends StatelessWidget {
  const _NotificationSection({
    required this.title,
    required this.subtitle,
    required this.enabled,
    required this.onChanged,
    required this.detail,
    required this.onDetailTap,
  });
  final String title;
  final String subtitle;
  final bool enabled;
  final ValueChanged<bool>? onChanged;
  final String detail;
  final VoidCallback? onDetailTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          SwitchListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            value: enabled,
            onChanged: onChanged,
          ),
          ListTile(
            title: Text(detail),
            leading: const Icon(Icons.schedule),
            onTap: onDetailTap,
          ),
        ],
      ),
    );
  }
}
