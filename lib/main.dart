import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Fasedavida());
}

class Fasedavida extends StatelessWidget {
  const Fasedavida({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Determine sua fase da vida',
      home: Vida(),
    );
  }
}

class Vida extends StatefulWidget {
  const Vida({super.key});

  @override
  State<Vida> createState() => _VidaState();
}

class _VidaState extends State<Vida> {
  double idade = 0;
  String resultvida = '';

  TextEditingController idadeController = TextEditingController();

  determinarFaseDaVida() {
    double idade = double.parse(idadeController.text);

    if (idade <= 3) {
      resultvida = 'Infância';
    } else if (idade <= 12) {
      resultvida = 'Pré-adolescência';
    } else if (idade <= 19) {
      resultvida = 'Adolescência';
    } else if (idade <= 35) {
      resultvida = 'Juventude';
    } else if (idade <= 55) {
      resultvida = 'Meia-idade';
    } else if (idade <= 130) {
      resultvida = 'Terceira idade';
    } else {
      resultvida = 'Virou estampa de camisa';
    }

    setState(() {
      resultvida;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Determine sua fase da vida',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 94, 50, 107),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 300), // Largura máxima de 300
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: idadeController,
                  decoration: InputDecoration(
                    labelText: 'Digite sua idade',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSubmitted: (value) => determinarFaseDaVida(),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: determinarFaseDaVida,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Mostrar fases da vida',
                    style: TextStyle(fontSize: 18),
                    selectionColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 32),
                resultvida == ''
                    ? const Text('')
                    : Text(
                        'Sua fase da vida é: $resultvida',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(221, 108, 56, 133),
                        ),
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
