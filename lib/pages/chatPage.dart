import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lookmefront/model/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/offres.dart';
import '../services/authservices.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  final String sellerId;
  final String costumerId;
  final String orderId;
  const ChatPage(this.sellerId, this.costumerId, this.orderId);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [];

  final IO.Socket _socket = IO.io("https://flutterauth10.herokuapp.com/",
      IO.OptionBuilder().setTransports(['websocket']).build());

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? token = prefs.getString('token');
    return token;
  }

  _addsMessages(List<dynamic> data) {
    print(data);
    setState(() {
      messages = data
          .where((json) => json["orderId"] == widget.orderId)
          .map((element) {
        return Message.fromJson(element);
      }).toList();
    });
  }

  _addMessage(msg) {
    print(msg);
    setState(() {
      var message = Message.fromJson(msg);
      if (message.orderId == widget.orderId) {
        List<Message> cloned = List.from(messages);

        cloned.add(message);
        messages = cloned;
      }
    });
  }

  _afterConnection() {
    _socket.emit("init");
    _socket.on("messages", (data) => {_addsMessages(data)});
    _socket.on("newMessage", (data) => {_addMessage(data)});
  }

  _connectSocket() {
    _socket.onConnect((data) => _afterConnection());
    _socket.onConnectError((data) => print('erreur socket: $data'));
    _socket.onDisconnect((data) => print("socket/io server disconnected"));
  }

  _sendMessage() {
    _socket.emit('message', {
      'msg': msgController.text.trim(),
      'senderId': widget.costumerId,
      'receiverId': widget.sellerId,
      'orderId': widget.orderId
    });
  }

  TextEditingController msgController = new TextEditingController();

  final ScrollController controller =
      ScrollController(initialScrollOffset: 10000);
  late String content;

  Future scrollToItem() async {
    controller.jumpTo(controller.position.maxScrollExtent * 1.5);
  }

  @override
  void initState() {
    super.initState();
    _connectSocket();
    msgController.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://robe-vintage.net/upl/2017/02/robe-vintage-retro-a-pois.png")),
            ),
            Column(
              children: [
                Text("User"),
                Text(
                  "en ligne",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ],
        ),
      ),
      body: bodyTestPage(),
      bottomSheet: Container(
          width: size.width,
          color: Colors.white,
          child: Container(
            height: 100,
            width: Size.infinite.width,
            child: Row(
              children: [
                Container(
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Write message"),
                      controller: msgController,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (msgController.text.isNotEmpty) {
                      _sendMessage();
                      msgController.clear();
                      setState(() {
                        scrollToItem();
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget bodyTestPage() {
    return ListView.builder(
        controller: controller,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Text(messages[index].msg);
        });
  }

  Widget bodyPage() {
    return FutureBuilder<List<Offre>>(
        future: AuthService().getOffreById('629032e2b4b3b5c4d33eeb77'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            // List documents = snapshot.data!.docs;
            // List<Message> messages = [];
            // documents.forEach((element) {
            //   Message msg = Message(element);
            //   if (((monProfil.uid == msg.uidSender) &
            //           (widget.user.uid == msg.uidRecever)) |
            //       ((monProfil.uid == msg.uidRecever) &
            //           (widget.user.uid == msg.uidSender))) {
            //     messages.add(msg);
            //   }
            // });
            // messages.sort(((a, b) => a.date.compareTo(b.date)));

            return Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                  controller: controller,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var offre = (snapshot.data as List<Offre>)[index];
                    if (offre.cost == 100 ||
                        offre.cost == 40 ||
                        offre.cost == 300) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(offre.updatedAt.toString()),
                              Flexible(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.6),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 93, 173, 238)),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        offre.title,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(
                                      "https://robe-vintage.net/upl/2017/02/robe-vintage-retro-a-pois.png"))
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(
                                      "https://robe-vintage.net/upl/2017/02/robe-vintage-retro-a-pois.png")),
                            ),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.6),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Color.fromARGB(255, 216, 213, 213)),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      offre.title,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(offre.updatedAt.toString())
                          ],
                        ),
                      );
                    }
                  }),
            );
          }
        });
  }
}
