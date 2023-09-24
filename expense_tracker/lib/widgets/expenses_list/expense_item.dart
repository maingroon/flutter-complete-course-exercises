import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
    required this.onRemoveAction,
  });

  final Expense expense;
  final void Function(Expense) onRemoveAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ValueKey(expense),
        background: Card(
          margin: EdgeInsets.zero,
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        onDismissed: (direction) {
          onRemoveAction(expense);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 5),
                  Text(expense.formattedDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
