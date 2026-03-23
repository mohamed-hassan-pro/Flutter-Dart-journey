import 'package:flutter/material.dart';
import 'package:homeworks/2/core/constants/app_dimensions.dart';
import 'package:homeworks/2/core/constants/app_strings.dart';
import 'package:homeworks/2/core/theme/app_colors.dart';
import 'package:homeworks/2/core/theme/app_text_styles.dart';

class QuickStatsSection extends StatelessWidget {
  const QuickStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(AppStrings.quickStatsTitle, style: AppTextStyles.sectionTitle),
          SizedBox(height: AppDimensions.paddingSmall),
          SizedBox(
            width: double.infinity - AppDimensions.paddingMedium,
            child: Row(
              mainAxisAlignment: .center,
              children: [
                StatCardItem(
                  icon: Icons.people_alt_rounded,
                  data: '1,234',
                  label: AppStrings.usersLabel,
                ),
                SizedBox(width: AppDimensions.paddingSmall),
                StatCardItem(
                  icon: Icons.star_rounded,
                  data: '4.8',
                  label: AppStrings.ratingLabel,
                ),
                SizedBox(width: AppDimensions.paddingSmall),
                StatCardItem(
                  icon: Icons.trending_up_rounded,
                  data: '98%',
                  label: AppStrings.successLabel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatCardItem extends StatelessWidget {
  final IconData icon;
  final String data;
  final String label;

  const StatCardItem({
    required this.data,
    required this.label,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingSmall),

      width:
          (MediaQuery.of(context).size.width / 3) -
          (AppDimensions.paddingLarge),
      decoration: BoxDecoration(color: AppColors.cardBackground),
      child: Column(children: [Icon(icon), Text(data), Text(label)]),
    );
  }
}
