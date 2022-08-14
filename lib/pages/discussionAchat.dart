import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/locationCardContact.dart';
import 'package:lookmefront/model/chat.dart';
import 'package:lookmefront/pages/chatPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/locationCard.dart';
import '../model/offres.dart';
import '../services/authservices.dart';
import 'addOffer.dart';

class DiscussionAchatPage extends StatefulWidget {
  final String userId;
  DiscussionAchatPage(this.userId);

  @override
  _DiscussionAchatPageState createState() => _DiscussionAchatPageState();
}

class _DiscussionAchatPageState extends State<DiscussionAchatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              future: AuthService().getChatsBycostumerId(widget.userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var chat = (snapshot.data as List<Chat>)[index];
                        // print("--------------------- test: " +
                        //     snapshot.data.toString());
                        return LocationCardContact(chat.title, chat.image, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(chat.sellerId,
                                    chat.costumerId, chat.orderId)),
                          );
                        });
                      });
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ])

        /*ListView(
          children: [OrderCard("2344654654", "20/07/2022", 3, 150)],
        )*/
        );
  }
}
