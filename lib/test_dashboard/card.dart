import 'package:flutter/material.dart';
import 'package:saber_static_ui/huge_icons.dart';
import 'package:saber_static_ui/themes/components/customcard.dart';

class HeaderUsageDemo extends StatelessWidget {
  const HeaderUsageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Header + Icons')),
      body: ListView(
        children: [
          CustomCard(
            leading: const Icon(HugeIcons.user_list_standard_outline, size: 22),
            title: 'المعلومات الشخصية',

            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          CustomCard(
            leading: const Icon(HugeIcons.crown_rounded_outline, size: 22),
            title: 'الباقات',

            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          CustomCard(
            leading: const Icon(
              HugeIcons.account_setting_02_rounded_outline,
              size: 22,
            ),
            title: 'اعدادات التطبيق',

            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          CustomCard(
            leading: const Icon(HugeIcons.give_star_rounded_outline, size: 22),
            title: 'الدعم والمساعدة',

            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          CustomCard(
            leading: const Icon(HugeIcons.logout_03_rounded_outline, size: 22),
            title: 'تسجيل خروج',
          ),
          SizedBox(height: 14),
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.school_report_card_rounded_outline,
              size: 22,
            ),
            title: 'اللغة',
            actionImage: 'assets/images/Country Flags.png',
            actionLabel: 'العربية',
            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          ///////////////
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.money_exchange_01_rounded_outline,
              size: 22,
            ),
            title: 'العملة الاساسية',

            actionLabel: 'الريال اليمني',
            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          /////////////
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.moon_02_rounded_outline,

              color: Colors.black,
            ),
            title: 'الوضع الليلي',
            actionSwitchValue: false,
          ),
          SizedBox(height: 14),
          ////////////////////////
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.notification_02_rounded_outline,
              size: 22,
            ),
            title: 'الاشعارات',

            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          ///////////////////
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.settings_03_standard_outline,
              size: 22,
            ),
            title: 'تغير كلمة المرور',

            actionIcon: HugeIcons.arrow_left_01_standard_outline,
          ),
          SizedBox(height: 14),
          //////////
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.notification_02_rounded_outline,
              size: 25,
              color: Colors.black,
            ),
            title: 'إشعارات النظام',

            actionSwitchValue: true,
          ),
          SizedBox(height: 14),
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.briefcase_05_rounded_outline,
              size: 25,
              color: Colors.black,
            ),
            title: 'إشعارات الوظائف',
            actionSwitchValue: true,
          ),
          SizedBox(height: 14),
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.store_01_rounded_outline,
              size: 25,
              color: Colors.black,
            ),
            title: 'إشعارات الماركت',
            actionSwitchValue: false,
          ),
          // SizedBox(height: 14),
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.shopping_bag_02_rounded_outline,
              size: 20,
              color: Colors.black,
            ),
            title: 'سوق',
            actionSwitchValue: false,
          ), // SizedBox(height: 14),
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.building_05_standard_outline,
              size: 20,
              color: Colors.black,
            ),
            title: 'مركبات',
            actionSwitchValue: false,
          ), // SizedBox(height: 14),
          CustomCard(
            textDirection: TextDirection.rtl,
            leading: const Icon(
              HugeIcons.briefcase_05_rounded_outline,
              size: 20,
              color: Colors.black,
            ),
            title: 'عقارات',
            actionSwitchValue: false,
          ),
        ],
      ),
    );
  }
}
