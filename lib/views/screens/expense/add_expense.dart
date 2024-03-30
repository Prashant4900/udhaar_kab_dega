import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/components/text_field_with_label.dart';

enum PaidBy { me, other }

class MyAddNewExpense extends StatefulWidget {
  const MyAddNewExpense({super.key});

  @override
  State<MyAddNewExpense> createState() => _MyAddNewExpenseState();
}

class _MyAddNewExpenseState extends State<MyAddNewExpense> {
  PaidBy paidBy = PaidBy.me;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Transaction',
          style: context.appBarTextStyle(),
        ),
      ),
      body: Padding(
        padding: horizontalPadding16 + topPadding12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Paid by',
                  style: context.subHeadlineTextStyle(),
                ),
                Radio(
                  value: PaidBy.me,
                  groupValue: paidBy,
                  onChanged: (value) {
                    setState(() {
                      paidBy = value ?? PaidBy.me;
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      paidBy = PaidBy.me;
                    });
                  },
                  child: Text(
                    'me',
                    style: context.subHeadlineTextStyle(),
                  ),
                ),
                Radio(
                  value: PaidBy.other,
                  groupValue: paidBy,
                  onChanged: (value) {
                    setState(() {
                      paidBy = value ?? PaidBy.other;
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      paidBy = PaidBy.other;
                    });
                  },
                  child: Text(
                    'someone else',
                    style: context.subHeadlineTextStyle(),
                  ),
                ),
                if (paidBy == PaidBy.other)
                  DropdownButton<String>(
                    value: 'Friend 1', // Initially selected option
                    onChanged: print,
                    underline: emptyWidget,
                    style: context.subHeadlineTextStyle(),
                    items: <String>[
                      'Friend 1',
                      'Friend 2',
                      'Friend 3',
                      'Friend 4',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
              ],
            ),
            verticalMargin12,
            const TextFieldWithLabel(
              label: 'Title',
              hintText: 'Transaction detail',
            ),
            verticalMargin12,
            const TextFieldWithLabel(
              label: 'Amount',
              hintText: 'Enter amount',
            ),
            verticalMargin24,
            Text(
              'Group',
              style: context.subHeadlineTextStyle(),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Select a group',
                style: context.bodyTextStyle(),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 20,
              ),
            ),
            verticalMargin12,
            Text(
              'Transaction date',
              style: context.subHeadlineTextStyle(),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
              },
              title: Text(
                'March 27 2024 07:45 PM',
                style: context.bodyTextStyle(),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 20,
              ),
            ),
            const Spacer(),
            CustomButton(
              label: 'Add Transaction',
              onTap: () {},
            ),
            verticalMargin48,
          ],
        ),
      ),
    );
  }
}
