import 'package:flutter/material.dart';


void main() 
{
  runApp(A_f_shot_of_espresso());
}

class A_f_shot_of_espresso extends StatelessWidget 

{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emma s Coffe Shop',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashScreen(),
      routes: 
      {
        '/home': (context) => HomeScreen(),
        '/recipe-detail': (context) => RecipeDetailScreen(),
        '/create-recipe': (context) => CreateRecipeScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    Future.delayed(Duration(seconds: 5), () 
    {
      Navigator.pushReplacementNamed(context, '/home');
    });
    
    return Scaffold
    (
      backgroundColor: const Color.fromARGB(255, 196, 99, 64),
      body: Center
      (
        child: Column
        (
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [

            Icon(Icons.local_cafe, size: 75, color: Colors.white),
            SizedBox(height: 20),

            Text
            (
              'Emma s Coffe Shop',
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar
      (
        title: Text('Emma s Coffe Shop'),
      ),
      body: ListView
      (
        padding: EdgeInsets.all(10),
        children: 
        [
          _buildCard
          (
            context,
            'Ver recetas',
            Icons.coffee,
            '/recipe-detail',
          ),
          _buildCard
          (
            context,
            'Crear nueva receta',
            Icons.add,
            '/create-recipe',
          ),
          _buildCard
          (
            context,
            'Recetas Favoritas',
            Icons.favorite,
            '/favorites',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, String route) 
  {
    return Card
    (
      child: ListTile
      (
        leading: Icon(icon, size: 75, color: const Color.fromARGB(255, 126, 56, 31)),
        title: Text(title, style: TextStyle(fontSize: 30)),
        onTap: () 
        {
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
        title: Text('Detalles'),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(16.0),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Text('Espresso Emma', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Text('Ingredientes:', style: TextStyle(fontSize: 34)),
            Text('• Granos de Café\n• Agua', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),

            Text('Pasos:', style: TextStyle(fontSize: 34)),
            Text('1.Moler los granos.\n2. Hervir el agua.\n3. Colar el café.', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}


class CreateRecipeScreen extends StatefulWidget 
{
  @override
  _CreateRecipeScreenState createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> 
{
  final _formKey = GlobalKey<FormState>();
  String _recipeName = '';
  String _ingredients = '';
  String _steps = '';

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Crear nueva receta', style: TextStyle(fontSize: 24)),
      ),
      body: Padding
      (
        padding: EdgeInsets.all(16.0),
        child: Form
        (
          key: _formKey,
          child: Column
          (
            children: 
            [
              TextFormField
              (
                decoration: InputDecoration(labelText: 'Nombre de la receta'),
                onSaved: (value) 
                {
                  _recipeName = value!;
                },
              ),
              TextFormField
              (
                decoration: InputDecoration(labelText: 'Ingredientes'),
                onSaved: (value) 
                {
                  _ingredients = value!;
                },
              ),
              TextFormField
              (
                decoration: InputDecoration(labelText: 'Pasos'),
                onSaved: (value) {
                  _steps = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton
              (
                onPressed: ()
                 {
                  _formKey.currentState!.save();
                  // Save recipe logic
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
}



class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos', style: TextStyle(fontSize: 34)),
      ),
      body: Center(
        child: Text('Esta sección parece estar vacia!', style: TextStyle(fontSize: 34)),
      ),
    );
  }
}
