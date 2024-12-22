import 'package:flutter/material.dart';

void main() {
  runApp(FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Handle the Bottom Navigation bar change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Type to search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Handle search logic here
                    print('Searching for: $value');
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Search Results:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Add search results display logic here
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivering to',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              'SNS Kalvi Nagar, Sathy Main Road...',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearchDialog(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView(
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    5,
                        (index) => _CategoryCard(
                      title: 'Pizza',
                      icon: Icons.local_pizza,
                      subtitle: '15 items',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Top Picks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView(
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    5,
                        (index) => _TopPickCard(title: 'Kwality Walls', time: '23 mins'),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Restaurants',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _RestaurantCard(
                    name: 'Restaurant Name',
                    details: 'Pizza, Italian • 30 mins • ₹300 for two',
                    rating: '4.1',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // This will highlight the selected item
        onTap: _onItemTapped, // Handle the item taps
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar), // 3D View icon
            label: 'View 3D',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.orange),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopPickCard extends StatelessWidget {
  final String title;
  final String time;

  const _TopPickCard({
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                time,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  final String name;
  final String details;
  final String rating;

  const _RestaurantCard({
    required this.name,
    required this.details,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.orange,
              child: Icon(Icons.restaurant, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    details,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Column(
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text(rating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
