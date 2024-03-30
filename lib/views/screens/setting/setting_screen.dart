import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/screens/auth/bloc/auth_bloc.dart';
import 'package:udhaar_kab_dega/views/screens/profile_details/profile_detail_screen.dart';

final settingItems = [
  {
    'index': 0,
    'name': 'Friends',
    'route': const MyProfileDetailScreen(),
  },
  {
    'index': 1,
    'name': 'Groups',
    'route': const MyProfileDetailScreen(),
  },
  {
    'index': 2,
    'name': 'Hotspots',
    'route': const MyProfileDetailScreen(),
  },
  {
    'index': 3,
    'name': 'Transaction Type',
    'route': const MyProfileDetailScreen(),
  },
  {
    'index': 4,
    'name': 'Profile details',
    'route': const MyProfileDetailScreen(),
  },
  {
    'index': 5,
    'name': 'Settings',
    'route': const MyProfileDetailScreen(),
  },
  {
    'index': 6,
    'name': 'About us',
    'route': const MyProfileDetailScreen(),
  },
  {
    'index': 7,
    'name': 'Help & supports',
    'route': const MyProfileDetailScreen(),
  },
];

class MySettingScreen extends StatelessWidget {
  const MySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: horizontalPadding16,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalMargin12,
                      Text(
                        state.user.displayName!,
                        style: context.headlineTextStyle(),
                      ),
                      verticalMargin4,
                      Text(
                        'Email: ${state.user.email}',
                        style: context.bodySmallTextStyle(),
                      ),
                      verticalMargin24,
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: settingItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.7,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final data =
                              settingItems[index] as Map<String, dynamic>;
                          return MySettingItem(
                            name: data['name'] as String,
                            screen: data['route'] as Widget,
                          );
                        },
                      ),
                      verticalMargin32,
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Made in India with  ❤️',
                              style: context.bodyTextStyle(),
                            ),
                            verticalMargin4,
                            Text(
                              'v 4.1.8(813)',
                              style: context.bodySmallTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return emptyWidget;
      },
    );
  }
}

class MySettingItem extends StatelessWidget {
  const MySettingItem({required this.name, required this.screen, super.key});

  final String name;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF26282F),
      ),
      padding: verticalPadding12 + horizontalPadding16,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => screen,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              name,
              style: context.buttonTextStyle().copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
