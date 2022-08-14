import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookmefront/components/button.dart';
import 'package:lookmefront/pages/discussionAchat.dart';
import 'package:lookmefront/pages/discussionVentePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoixDiscussionPage extends StatelessWidget {
  const ChoixDiscussionPage({Key? key}) : super(key: key);

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    print(userId);
    return userId;
  }

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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Button("Mes achats", true, false, 160, 60, () async {
                var id = await getUserId();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiscussionAchatPage(id)),
                );
              }, 10),
            ),
            Button("Mes ventes", false, false, 160, 60, () async {
              var id = await getUserId();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DiscussionVentePage(id)),
              );
            }, 10)
          ],
        ),
      ),
    );
  }
}
