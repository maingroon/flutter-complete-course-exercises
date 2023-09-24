import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Apples',
      amount: 1.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Pants',
      amount: 5.10,
      date: DateTime.now(),
      category: Category.other,
    ),
    Expense(
      title: 'Communals',
      amount: 120,
      date: DateTime.now(),
      category: Category.household,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.removeAt(expenseIndex);
    });
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return NewExpense(
          onAddAction: _addExpense,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget expensesListWidget = const Center(
      child: Text('No expenses yet'),
    );

    if (_registeredExpenses.isNotEmpty) {
      expensesListWidget = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveAction: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter ExpenseTracker',
        ),
      ),
      body: Stack(
        children: [
          expensesListWidget,
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: FloatingActionButton.extended(
                onPressed: _openAddExpenseOverlay,
                icon: const Icon(Icons.add),
                label: const Text('Add expsense'),
                extendedPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
