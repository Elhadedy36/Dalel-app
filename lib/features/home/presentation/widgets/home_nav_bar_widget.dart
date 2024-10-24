import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      items: _navbaritem(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: HomeView(),
    ),
    CartView(),
    SearchView(),
    ProfileView()
  ];
}

List<PersistentBottomNavBarItem> _navbaritem() {
  return [
    PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.brown,
        ),
        inactiveIcon: Icon(
          Icons.home_outlined,
          color: Colors.brown.withOpacity(0.5),
        )),
    PersistentBottomNavBarItem(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.brown,
        ),
        inactiveIcon: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.brown.withOpacity(0.5),
        )),
    PersistentBottomNavBarItem(
        icon: Icon(
          Icons.search,
          color: Colors.brown,
        ),
        inactiveIcon: Icon(
          Icons.search_sharp,
          color: Colors.brown.withOpacity(0.5),
        )),
    PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.brown,
        ),
        inactiveIcon: Icon(
          Icons.person_2_outlined,
          color: Colors.brown.withOpacity(0.5),
        )),
  ];
}
