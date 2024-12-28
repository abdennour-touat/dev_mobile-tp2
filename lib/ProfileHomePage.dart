
import 'package:flutter/material.dart';


// Le widget de notre page d'accueil
class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Card"),
        centerTitle: true, // Centre le titre de l'AppBar
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _getCard(), // Affiche la carte de profil
            Positioned(
              top: 30, // Place l'avatar au-dessus de la carte
              child: _getAvatar(),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour créer la carte de profil
  Container _getCard() {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Abdenour Touat ",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "dummy@gmail.com",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour créer l'avatar
  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.wikia.nocookie.net%2Fdubbergemeinde%2Fimages%2F0%2F03%2FChika_Fujiwara.jpg%2Frevision%2Flatest%3Fcb%3D20210406163605%26path-prefix%3Dde&f=1&nofb=1&ipt=d51644706a19d9e2d00fbcbe35ff6b1be3b99a0f650df48624cea9068b6b0d69&ipo=images'), // URL de l'image
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}