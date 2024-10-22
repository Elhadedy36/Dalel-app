import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_widget.dart';
import 'package:dalel/features/home/data/category_model.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_horizontal_listview.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_widget.dart';
import 'package:dalel/features/home/presentation/widgets/home_app_bar_widget.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
           
/************************************************************************
              home Appbar section
************************************************************************/
 
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),

            const SliverToBoxAdapter(
              child: CustomHomeViewAppBar(),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
/************************************************************************
              home historcal periods section
************************************************************************/
 
            const SliverToBoxAdapter(
              child: CustomHeaderText(text: AppStrings.historicalperiods),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),



            const SliverToBoxAdapter(
              child: HistoricalPeriods(),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),

/************************************************************************
              home historcal CHARACTERS section
************************************************************************/
 
            const SliverToBoxAdapter(
              child: CustomHeaderText(text: AppStrings.historicalCharacters),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),

            SliverToBoxAdapter(
              child: CustomCategoryHorizontalListView(
                categlist: CharactersCategList,
              ),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),

/************************************************************************
              home historcal SOVENEURS section
************************************************************************/
 
            const SliverToBoxAdapter(
              child: CustomHeaderText(text: AppStrings.historicalSouvenirs),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),

            SliverToBoxAdapter(
              child: CustomCategoryHorizontalListView(
                categlist: SouvenirsCategList,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
