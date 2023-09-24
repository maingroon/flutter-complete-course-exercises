import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveAction,
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveAction;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length + 1,
      itemBuilder: (ctx, index) {
        if (index == 0) {
          return Chart(expenses: expenses);
        }
        return ExpenseItem(
          expense: expenses[index - 1],
          onRemoveAction: onRemoveAction,
        );
      },
    );
  }
}
