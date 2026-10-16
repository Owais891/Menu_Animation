import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const RestaurantPage(),
    );
  }
}

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Food Items',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            MenuItemWidget(
              name: 'Classic Beef Burger',
              image:
                  'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&auto=format&fit=crop',
              description:
                  'Juicy 100% beef patty topped with melted cheddar cheese, fresh crisp lettuce, tomatoes, pickles, and signature house sauce on a toasted bun.',
              prepTime: '15 mins',
              calories: '550 kcal',
              rating: '4.8 ★',
            ),
            MenuItemWidget(
              name: 'Pepperoni Pizza',
              image:
                  'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&auto=format&fit=crop',
              description:
                  'Hand-tossed pizza crust smothered in rich tomato sauce, melted mozzarella cheese, and loaded with savory crispy pepperoni slices.',
              prepTime: '20 mins',
              calories: '850 kcal',
              rating: '4.9 ★',
            ),
            MenuItemWidget(
              name: 'Creamy Italian Pasta',
              image:
                  'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=500&auto=format&fit=crop',
              description:
                  'Al dente fettuccine tossed in a silky parmesan garlic cream sauce, infused with Italian herbs and freshly cracked black pepper.',
              prepTime: '15 mins',
              calories: '620 kcal',
              rating: '4.7 ★',
            ),

            SizedBox(height: 24),
            Text(
              'Drinks & Beverages',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            MenuItemWidget(
              name: 'Iced Coffee',
              image:
                  'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=500&auto=format&fit=crop',
              description:
                  'Slow-steeped espresso poured over fresh ice, blended with cold whole milk and sweet vanilla syrup.',
              prepTime: '5 mins',
              calories: '180 kcal',
              rating: '4.8 ★',
            ),
            MenuItemWidget(
              name: 'Fresh Orange Juice',
              image:
                  'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500&auto=format&fit=crop',
              description:
                  '100% pure squeezed sun-ripened oranges served chilled. Packed with natural Vitamin C and zero added sugar.',
              prepTime: '5 mins',
              calories: '120 kcal',
              rating: '4.9 ★',
            ),
            MenuItemWidget(
              name: 'Chocolate Milkshake',
              image:
                  'https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&auto=format&fit=crop',
              description:
                  'Rich dark chocolate ice cream blended with cold milk, topped with whipped cream and chocolate drizzle.',
              prepTime: '8 mins',
              calories: '420 kcal',
              rating: '4.8 ★',
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String prepTime;
  final String calories;
  final String rating;

  const MenuItemWidget({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.prepTime,
    required this.calories,
    required this.rating,
  });

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  bool _showFirst = true;

  void _toggleFade() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: _toggleFade,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedCrossFade(
          duration: const Duration(seconds: 5),
          sizeCurve: Curves.fastOutSlowIn,
          firstCurve: Curves.easeInOut,
          secondCurve: Curves.easeInOut,
          crossFadeState: _showFirst
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: AnimatedOpacity(
            duration: const Duration(seconds: 5),
            opacity: _showFirst ? 1.0 : 0.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.image,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 70,
                        width: 70,
                        color: Colors.grey[300],
                        child: const Icon(Icons.fastfood, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
            ),
          ),
          // Second Child: Expanded View with 5-Second Duration
          secondChild: AnimatedOpacity(
            duration: const Duration(seconds: 5),
            opacity: _showFirst ? 0.0 : 1.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Colors.black,
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          widget.image,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.fastfood,
                                size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_up,
                          color: Colors.deepOrange),
                    ],
                  ),
                  const SizedBox(height: 8),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 5),
                    opacity: _showFirst ? 0.0 : 1.0,
                    child: Row(
                      children: [
                        _DetailChip(
                            icon: Icons.timer_outlined, label: widget.prepTime),
                        const SizedBox(width: 8),
                        _DetailChip(
                            icon: Icons.local_fire_department_outlined,
                            label: widget.calories),
                        const SizedBox(width: 8),
                        _DetailChip(
                            icon: Icons.star_outline, label: widget.rating),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 4),
                    opacity: _showFirst ? 0.0 : 1.0,
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey[800],
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.deepOrange),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
