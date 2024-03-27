import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/app/app.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/gen/assets.gen.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/screens/expense/add_expense.dart';
import 'package:udhaar_kab_dega/views/screens/friends/add_friend_screen.dart';
import 'package:udhaar_kab_dega/views/screens/groups/create_group_screen.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Hi, Prashant Nigam',
          style: context.appBarTextStyle(),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'P',
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Assets.svg.setting.svg(
                    width: 17,
                  ),
                ),
              ],
            ),
          ),
          horizontalMargin16,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<dynamic>(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          padding: horizontalPadding16 + bottomPadding48,
          children: [
            verticalMargin48,
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                radius: 20,
                child: Icon(Icons.group, size: 20),
              ),
              title: Text(
                'Create a new group.',
                style: context.bodyTextStyle().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const MyCreateGroupScreen(),
                  ),
                ).whenComplete(() => Navigator.pop(context));
              },
              trailing: IconButton(
                onPressed: () {},
                icon: Assets.svg.info.svg(),
              ),
            ),
            verticalMargin12,
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                radius: 20,
                child: Icon(Icons.person, size: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const MyAddFriendScreen(),
                  ),
                ).whenComplete(() => Navigator.pop(context));
              },
              title: Text(
                'Add a new friend.',
                style: context.bodyTextStyle().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Assets.svg.info.svg(),
              ),
            ),
            verticalMargin48 + verticalMargin16,
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const MyAddNewExpense(),
                  ),
                ).whenComplete(() => Navigator.pop(context));
              },
              label: 'Add new Expense',
            ),
          ],
        );
      },
    );
  }
}
