import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ItemRow extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconBackground;
  final VoidCallback? onTap;

  const ItemRow({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconBackground = const Color(0xFFE3F2E3),
    this.onTap,
  });

  @override
  State<ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<ItemRow> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapCancel: () => setState(() => _isPressed = false),
        onTapUp: (_) => setState(() => _isPressed = false),

        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),

        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              height: 60,
              width: double.infinity,
              color: _isPressed
                  ? Colors.grey.withOpacity(0.15)
                  : Colors.transparent,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.iconBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(widget.icon, size: 24,color: AppColor.black,),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: AppColor.textBlack(context)
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.description,
                          style: AppColor.textgrey,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
