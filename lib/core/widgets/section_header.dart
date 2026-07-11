import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';
import '../theme/app_text_styles.dart';

/// Reusable section heading with an optional trailing action.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.subtitle,
    this.trailing,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: AppDimensions.spacing12,
      spacing: AppDimensions.spacing16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.sectionTitle),
            const SizedBox(height: AppDimensions.spacing4),
            Text(subtitle, style: AppTextStyles.bodyMuted),
          ],
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
