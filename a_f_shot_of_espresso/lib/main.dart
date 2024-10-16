import 'package:flutter/material.dart';

void main() {
  runApp(CoffeeRecipesApp());
}

class CoffeeRecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Recipes',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/recipe-detail': (context) => RecipeDetailScreen(),
        '/create-recipe': (context) => CreateRecipeScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_cafe, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Coffee Recipes',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Recipes'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _buildCard(
            context,
            'Explore Recipes',
            Icons.coffee,
            '/recipe-detail',
          ),
          _buildCard(
            context,
            'Create New Recipe',
            Icons.add,
            '/create-recipe',
          ),
          _buildCard(
            context,
            'Favorites',
            Icons.favorite,
            '/favorites',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, String route) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 50, color: Colors.brown),
        title: Text(title, style: TextStyle(fontSize: 20)),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Espresso', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Ingredients:', style: TextStyle(fontSize: 18)),
            Text('• Coffee Beans\n• Water'),
            SizedBox(height: 10),
            Text('Steps:', style: TextStyle(fontSize: 18)),
            Text('1. Grind coffee beans.\n2. Boil water.\n3. Brew the coffee.'),
          ],
        ),
      ),
    );
  }
}

class CreateRecipeScreen extends StatefulWidget {
  @override
  _CreateRecipeScreenState createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _recipeName = '';
  String _ingredients = '';
  String _steps = '';

  @override
  void initState() {
    super.initState();
    print("initState: Widget creado");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies: Dependencias cambiadas");
  }

  @override
  Widget build(BuildContext context) {
    print("build: Construyendo el widget");
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear nueva receta', style: TextStyle(fontSize: 24)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre de la receta'),
                onSaved: (value) {
                  _recipeName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ingredientes'),
                onSaved: (value) {
                  _ingredients = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pasos'),
                onSaved: (value) {
                  _steps = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  print("setState: Guardando la receta");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Receta guardada!')),
                  );
                },
                child: Text('Salvar receta', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CreateRecipeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget: Widget actualizado");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate: Widget desactivado");
  }

  @override
  void dispose() {
    print("dispose: Widget eliminado");
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble: Aplicación reconstruida");
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text('No favorites yet!'),
      ),
    );
  }
}
