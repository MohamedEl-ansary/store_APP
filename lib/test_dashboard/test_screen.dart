// import 'package:flutter/material.dart';

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Test Dashboard'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Components'),
//               Tab(text: 'Flows'),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             _NavigationList(
//               title: 'UI Components',
//               items: [
//                 _NavigationItem(
//                   title: 'Buttons',
//                   description: 'Preview primary and secondary buttons.',
//                 ),
//                 _NavigationItem(
//                   title: 'Typography',
//                   description: 'Review text styles used across the app.',
//                 ),
//               ],
//             ),
//             _NavigationList(
//               title: 'User Flows',
//               items: [
//                 _NavigationItem(
//                   title: 'Checkout',
//                   description:

//                   'Step through a sample checkout experience.',
//                 ),
//                 _NavigationItem(
//                   title: 'Profile Setup',
//                   description: 'Walk through a basic onboarding flow.',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _NavigationList extends StatelessWidget {
//   const _NavigationList({required this.title, required this.items});

//   final String title;
//   final List<_NavigationItem> items;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       padding: const EdgeInsets.all(16),
//       itemCount: items.length + 1,
//       separatorBuilder: (_, __) => const SizedBox(height: 12),
//       itemBuilder: (context, index) {
//         if (index == 0) {
//           return Text(title, style: Theme.of(context).textTheme.titleLarge);
//         }

//         final item = items[index - 1];
//         return Card(
//           child: ListTile(
//             title: Text(item.title),
//             subtitle: Text(item.description),
//             trailing: const Icon(Icons.chevron_right),
//             onTap: () => Navigator.of(context).push(
//               MaterialPageRoute<void>(
//                 builder: (_) => _PlaceholderDetailScreen(item: item),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _NavigationItem {
//   const _NavigationItem({required this.title, required this.description});

//   final String title;
//   final String description;
// }

// class _PlaceholderDetailScreen extends StatelessWidget {
//   const _PlaceholderDetailScreen({required this.item});

//   final _NavigationItem item;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(item.title)),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Text(
//           'This is a placeholder for the "${item.title}" example.\n\n'
//           'Replace this screen with the actual implementation when ready.',
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:saber_static_ui/test_dashboard/My%20Portfolio.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Dashboard'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Components'),
              Tab(text: 'Flows'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _NavigationList(
              title: 'UI Components',
              items: [
                _NavigationItem(
                  title: 'Buttons',
                  description: 'Preview primary and secondary buttons.',
                  destination: MyPortfolioGallery(),
                ),
                _NavigationItem(
                  title: 'Typography',
                  description: 'Review text styles used across the app.',
                  destination: MyPortfolioGallery(),
                ),
              ],
            ),
            _NavigationList(
              title: 'User Flows',
              items: [
                _NavigationItem(
                  title: 'Checkout',
                  description: 'Step through a sample checkout experience.',
                  destination: MyPortfolioGallery(),
                ),
                _NavigationItem(
                  title: 'Profile Setup',
                  description: 'Walk through a basic onboarding flow.',
                  destination: MyPortfolioGallery(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationList extends StatelessWidget {
  const _NavigationList({required this.title, required this.items});

  final String title;
  final List<_NavigationItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(title, style: Theme.of(context).textTheme.titleLarge);
        }

        final item = items[index - 1];
        return Card(
          child: ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute<void>(builder: (_) => item.destination)),
          ),
        );
      },
    );
  }
}

class _NavigationItem {
  const _NavigationItem({
    required this.title,
    required this.description,
    required this.destination,
  });

  final String title;
  final String description;
  final Widget destination;
}
