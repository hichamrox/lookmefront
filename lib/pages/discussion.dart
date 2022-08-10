import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/locationCardContact.dart';
import 'package:lookmefront/model/chat.dart';
import 'package:lookmefront/pages/chatPage.dart';

import '../components/locationCard.dart';
import '../model/offres.dart';
import '../services/authservices.dart';
import 'addOffer.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({Key? key}) : super(key: key);

  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.search,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 40,
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            "Ma messagerie",
            style: GoogleFonts.merriweather(
                color: Color.fromARGB(255, 8, 8, 8),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ),
        body: Stack(children: [
          FutureBuilder<List<Chat>>(
              future:
                  AuthService().getChatsByUserId('62f17fe9781da377b6832b1c'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var chat = (snapshot.data as List<Chat>)[index];
                        return LocationCardContact(chat.title, chat.image, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(chat.sellerId, chat.costumerId)),
                          );
                        });
                      });
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddOfferPage(),
                      ));
                },
                child: Icon(Icons.add),
              ))
        ])

        /*ListView(
          children: [OrderCard("2344654654", "20/07/2022", 3, 150)],
        )*/
        );
  }
}
