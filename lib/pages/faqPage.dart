import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/accordion.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "FAQ",
          style: GoogleFonts.merriweather(
              color: Color.fromARGB(255, 8, 8, 8),
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
      ),
      body: SafeArea(
        child: ListView(children: [
          AccordionWidget(
              title: "Comment ça marche ?",
              content:
                  "Pour emprunter des tenues sur notre site, rien de plus simple :) sélectionnez l'article que vous souhaitez emprunter,vérifier la taille, la description puis vous pouvez definir le nombre de jours de location et ajouter au panier. N'hésitez pas à utiliser les filtres par couleurs, tailles, morphologie etc. Une commande doit être pour une seule et même date : si vous souhaitez passer commande pour deux occasions différentes, il faudra passer deux commandes distinctes. Le prix de locations vous sera prélevé uniquement si vous portez les articles. Si aucun des modèles n'est porté, vous serez prélevé du prix de location de l’article le moins cher de la commande. Les frais liés à une prolongation de durée (suppléments de 10€ pour 8 jours, 20€ pour 12 jours) ne sont pas remboursés."),
          AccordionWidget(
              title:
                  "Dois-je nettoyer les vêtements après les avoir empruntés ?",
              content:
                  "Pas de panique… vous n’avez rien à prévoir : Le pressing vous est offert ! ne cherchez pas à les nettoyer même s’il y a des taches. Notre pressing pourra rattraper les taches si elles n'ont pas été frottées au préalable."),
          AccordionWidget(
              title: "Combien de temps à l’avance puis-je réserver ?",
              content:
                  "Vous pouvez réserver jusqu’à six mois à l’avance, pour les plus prévoyantes. Et pour celles qui préfèrent se décider à la dernière minute, soyez libre de choisir au dernier moment, vous recevrez votre tenue le lendemain avant 13h pour toute commande passée avant 15h30 en semaine."),
          AccordionWidget(
              title: "Que faire si la taille ne me convient pas ?",
              content:
                  "Nous vous conseillons de prévoir une réception de vos colis un ou deux jours avant la date à laquelle vous souhaitez les porter, afin que nous puissions vous renvoyer un autre modèle rapidement si la taille ne convient pas."),
          AccordionWidget(
              title: "puis-je essayer les modèles ?",
              content:
                  "Nous proposons une formule essayage à 30€ qui vous permet de recevoir jusqu'à 3 modèles chez vous pour 24h afin de les essayer et de reprogrammer une date de location ensuite. vous avez la possibilité de choisir l’essayage lorsque vous êtes sur la fiche produit, cliquez sur essayer et votre commande passera automatiquement en formule essayage par la suite lorsque vous choisirez jusqu’à deux autres tenues.au moment de valider votre panier, vous ne payerez que 30€ la commande des 3 modèles. vous les recevrez chez vous à la date souhaitée et devrez les renvoyer le lendemain. une étiquette de sûreté est présente sur chaque pièce, ne la coupez surtout pas car cela nous prouve que vous avez juste essayé les modèles. il n’est pas possible de choisir la formule essayage pour les accessoires")
        ]),
      ),
    );
  }
}

// AccordionWidget("comment ça marche ?",`pour emprunter des tenues sur notre site, rien de plus simple 

// sélectionnez la date à laquelle vous souhaitez emprunter un modèle, puis vous aurez la sélection des pièces disponibles à cette date. il vous suffit ensuite de choisir ce qu’il vous plaît.

// n'hésitez pas à utiliser les filtres par couleurs, tailles, formes etc.

// une commande doit être pour une seule et même date : si vous souhaitez passer commande pour deux occasions différentes, il faudra passer deux commandes distinctes.

// vous pouvez ajouter jusqu’à deux articles supplémentaires dans votre colis pour seulement 5€ chacun (hors accessoires), leurs prix de locations vous seront prélevés uniquement si vous portez ces articles. si aucun des modèles n'est porté, vous serez prélevé du prix de location de l’article le moins cher de la commande. les frais liés à une prolongation de durée (suppléments de 10€ pour 8 jours, 20€ pour 12 jours) ne sont pas remboursés. les accessoires ne sont pas remboursés. les frais de 5€ pour les vêtements supplémentaires ne sont pas remboursés.``),
    