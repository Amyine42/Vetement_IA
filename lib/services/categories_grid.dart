import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vetement_ia/models/category.dart';


class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesRef = FirebaseDatabase.instance.ref('categories');

    return StreamBuilder(
      stream: categoriesRef.onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data?.snapshot?.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        Map<dynamic, dynamic> categoriesMap = snapshot.data!.snapshot!.value;
        List<Category> categories = categoriesMap.entries
            .map((e) => Category.fromMap(e.key, e.value))
            .toList();

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // Navigation vers les vêtements de cette catégorie
                  Navigator.pushNamed(
                    context, 
                    '/category',
                    arguments: category,
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        category.exampleImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text('${category.itemCount} articles'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}