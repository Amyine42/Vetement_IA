import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() async {
    final login = _loginController.text;
    final password = _passwordController.text;

    // Simulation d'une vérification en base
    try {
      bool userExists = await checkUserInDatabase(login, password);

      if (userExists) {
        // Navigation vers la page suivante
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NextPage()),
        );
      } else {
        // Log dans la console si l'utilisateur n'existe pas
        print('Utilisateur non trouvé: $login');
      }
    } catch (e) {
      print('Erreur lors de la vérification: $e');
    }
  }

  // Simulation de vérification en base de données
  Future<bool> checkUserInDatabase(String login, String password) async {
    // TODO: Implémenter la vraie vérification en base
    await Future.delayed(const Duration(seconds: 1)); // Simulation de délai réseau
    return login == "test" && password == "test";
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Application'), // Critère #1: headerBar avec nom
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Critère #2: Champ Login
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Login',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Critère #2 & #3: Champ Password obfusqué
            TextField(
              controller: _passwordController,
              obscureText: true, // Critère #3: Password obfusqué
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Critère #4: Bouton "Se connecter"
            ElevatedButton(
              onPressed: _handleLogin, // Critère #5 & #6: Gestion de la connexion
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Se connecter',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page suivante (à remplacer par votre vraie page)
class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Suivante')),
      body: const Center(child: Text('Connexion réussie!')),
    );
  }
}