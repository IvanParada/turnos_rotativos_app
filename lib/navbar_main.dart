import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:turnos_rotativos/core/constant/assets_constant.dart';
import 'package:turnos_rotativos/core/constant/color_constant.dart';
import 'package:turnos_rotativos/features/calendar/presentation/pages/calendar_page.dart';
import 'package:turnos_rotativos/features/home/presentation/pages/home_page.dart';
import 'package:turnos_rotativos/features/settings/presentation/pages/settings_page.dart';

class MainNavPage extends StatelessWidget {
  const MainNavPage({super.key});

  static final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _screens() {
    return const [HomePage(), CalendarPage(), SettingsPage()];
  }

  List<PersistentBottomNavBarItem> _items() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.home),
        title: 'Inicio',
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.textTertiary,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.calendar),
        title: 'Calendario',
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.textTertiary,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.settings),
        title: 'Ajustes',
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.textTertiary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .01),
      context,
      controller: _controller,
      screens: _screens(),
      items: _items(),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
