import 'package:flutter/material.dart';
import 'package:zker/core/utils/app_colors.dart';
import 'package:zker/core/utils/app_text_styles.dart';class CustomBtn extends StatefulWidget {
  const CustomBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
  });

  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  double scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => scale = 0.50); // يصغر فورًا
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => scale = 1.0); // يرجع طبيعي
    widget.onTap(); // تنفّذ التاب
  }

  void _onTapCancel() {
    setState(() => scale = 1.0); // لو تم إلغاء اللمس
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.translucent, // 👈 مهم جدًا
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutBack,
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
     
            borderRadius: BorderRadius.circular(15),
                   gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainColor,        // يبدأ باللون الأساسي
            Color(0xff5fa0b0),         // لون أفتح للأناقة
            Color(0xff8fc2d0),         // لون Fade خفيف
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],

          ),
          child: Center(
            child: Text(
              widget.title,
              style: AppTextStyles.titles.copyWith(color: AppColors.mainColor),
            ),
          ),
        ),
      ),
    );
  }
}
