import 'package:expense_tracker/widgets/add_new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _Expenses = [
    Expense(
        amount: 15,
        date: DateTime.now(),
        title: "game",
        category: Category.leisure),
    Expense(
        amount: 12,
        date: DateTime.now(),
        title: "burger",
        category: Category.food),
  ];

  void _openOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Domzi ExpenseTracker"), actions: [
        IconButton(onPressed: _openOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: ExpensesList(expenses: _Expenses)),
        ],
      ),
    );
  }
}
