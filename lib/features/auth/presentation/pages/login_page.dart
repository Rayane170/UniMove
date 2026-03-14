import 'package:flutter/material.dart';
import '../../../home/presentation/pages/main_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(

      backgroundColor: theme.scaffoldBackgroundColor,

      body: Container(

        /// gradient garde le design
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.2,
            center: const Alignment(0, -0.3),
            colors: theme.brightness == Brightness.dark
                ? const [
                    Color(0xFF1B2735),
                    Color(0xFF090A0F),
                  ]
                : const [
                    Color(0xFFFFFFFF),
                    Color(0xFFE5E7EB),
                  ],
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [

                  const Icon(
                    Icons.directions_bike,
                    color: Color(0xFF22C55E),
                    size: 70,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "UniMove",
                    style: TextStyle(
                      color: Color(0xFF22C55E),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Smart Green Mobility",
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium!.color!
                          .withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// matricule
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium!.color,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Matricule",
                        prefixIcon: Icon(Icons.person_outline),
                        suffixIcon: Icon(Icons.mail_outline),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// password
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium!.color,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Mot de passe",
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.visibility_off),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainHomePage(),
                          ),
                        );
                      },

                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium!.color!
                              .withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Pas encore de compte ?",
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium!.color!
                              .withOpacity(0.6),
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "S'inscrire",
                          style: TextStyle(
                            color: Color(0xFF22C55E),
                          ),
                        ),
                      ),
                    ],
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