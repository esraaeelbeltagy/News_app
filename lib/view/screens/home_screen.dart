import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_api/view/components/item.dart';
import 'package:news_app_with_api/view_model/cubits/theme/theme_cubit.dart';
import 'package:news_app_with_api/view_model/utils/colors/colors.dart';

import '../../view_model/cubits/cubit/news_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColor.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50).copyWith(),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                  ThemeCubit cubit = ThemeCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        cubit.changeTheme();
                      },
                      child: Row(
                        children: [
                         
                          Icon(
                            cubit.isDark ? Icons.dark_mode : Icons.light_mode,
                            color: cubit.isDark ? Colors.white : Colors.amber,
                          ),
                                  const SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              cubit.isDark ? "Dark Mode" : "Ligth Mode",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                      
                        Icon(
                          Icons.favorite_border,
                          color: AppColor.red,
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            "Favorite",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                      
                         Icon(
                          Icons.logout_outlined,
                      color: AppColor.primaryColor,
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            "Logout",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                NewsCubit cubit = NewsCubit.get(context);
                return SearchBar(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).scaffoldBackgroundColor),
                  controller: cubit.searchController,
                  textStyle: MaterialStatePropertyAll(
                      Theme.of(context).textTheme.bodySmall),
                  elevation: const MaterialStatePropertyAll(5.0),
                  hintText: 'Search',
                  hintStyle: MaterialStatePropertyAll(
                      Theme.of(context).textTheme.bodySmall),
                  leading: const Icon(Icons.search),
                  onSubmitted: (value) {
                    cubit.callApiRequest();
                  },
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                NewsCubit cubit = NewsCubit.get(context);
                return Visibility(
                  visible: state is! NewsLoadingState,
                  replacement: Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor),
                  ),
                  child: Visibility(
                    visible: cubit.allNews.isNotEmpty,
                    replacement: const Center(
                      child: Text("No news found"),
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          NewItem(article: cubit.allNews[index]),
                      itemCount: cubit.allNews.length,
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
