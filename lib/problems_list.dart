import 'package:flutter/material.dart';

class ProblemsList extends StatelessWidget {
  const ProblemsList({Key? key}) : super(key: key);
  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';

    return Scaffold(
      body: Scaffold(
        body: ListView(
          children: <Widget>[
            Card(
             child: ListTile(
               leading: const Icon(Icons.location_city),
               title: const Text("Test 1"),
               subtitle: const Text("Test 1"),
               trailing: TextButton(
                 onPressed: () {},
                 child: const Text('Delete'),
               ),
             ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_city),
                title: const Text("Test 2"),
                subtitle: const Text("Test 2"),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.add_circle_outline_outlined),
                title: const Text("Test 3"),
                subtitle: const Text("Test 3"),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _doNothing,
        tooltip: 'Add new problem',
        child: const Icon(Icons.add),
      ),
    );
  }
}
