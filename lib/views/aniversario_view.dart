import 'package:flutter/material.dart';
import 'package:tp_aniversario/aniversario_model.dart';

class AniversarioView extends StatefulWidget {
  final AniversarioModel aniversariante;
  const AniversarioView({super.key, required this.aniversariante});

  @override
  State<AniversarioView> createState() => _AniversarioViewState();
}

class _AniversarioViewState extends State<AniversarioView> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    funprecache();
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/baloons-img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0.0,
                      maxHeight: constraints.maxHeight,
                    ),
                    child: Container(
                      width: 800,
                      height: 800,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Feliz Aniversário ${widget.aniversariante.primeiroNome}!!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'happyBirthday',
                                fontSize: 35,
                                color: Colors.purple.shade300),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.network(
                            'https://i.gifer.com/TBUn.gif',
                            height: 300,
                            width: 300,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              // Handle the error and return a custom widget or error message
                              return Image.asset(
                                'assets/img/bolo-img.png',
                                height: 250,
                                width: 300,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Hoje você faz ${widget.aniversariante.idade} anos!!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'happyBirthday',
                                fontSize: 35,
                                color: Colors.pink.shade200),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width > 400)
                                ? 400
                                : MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            child: Text(
                                'Que neste novo ano a vida continue te surpreendendo com as coisas mais lindas que ela possa oferecer!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'PlayfairDisplayItalic',
                                    color: Colors.purple.shade300)),
                          )
                        ],
                      ),
                    ));
              })),
            ),
    );
  }

  funprecache() {
    precacheImage(const AssetImage('assets/img/baloons-img.jpg'), context)
        .then((value) {
      try {
        precacheImage(
                const NetworkImage('https://i.gifer.com/TBUn.gif'), context)
            .then((value) {
          setState(() {
            _isLoading = false;
          });
        });
      } catch (e) {
        precacheImage(const AssetImage('assets/img/bolo-img.png'), context)
            .then((value) {
          setState(() {
            _isLoading = false;
          });
        });
      }
    });
  }
}
