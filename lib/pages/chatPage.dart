import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lookmefront/model/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/offres.dart';
import '../services/authservices.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  final String senderId;
  final String receiverId;
  final String orderId;
  final String title;
  final String image;
  const ChatPage(
      this.senderId, this.receiverId, this.orderId, this.title, this.image);

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
    print(widget.orderId);
    print("sender : " + widget.senderId);
    print("receiver : " + widget.receiverId);
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
      'senderId': widget.senderId,
      'receiverId': widget.receiverId,
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
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                  radius: 20, backgroundImage: NetworkImage(widget.image)),
            ),
            Column(
              children: [
                Text(widget.title),
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
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Write message",
                          focusColor: Colors.black),
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
                      color: Color.fromARGB(255, 0, 0, 1),
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
          if (widget.senderId == messages[index].senderId) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(messages[index].createdAt.hour.toString() +
                        ":" +
                        messages[index].createdAt.minute.toString()),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 0, 0, 0)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              messages[index].msg,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (widget.receiverId == messages[index].senderId) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 216, 213, 213)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              messages[index].msg,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(messages[index].createdAt.hour.toString() +
                        ":" +
                        messages[index].createdAt.minute.toString())
                  ],
                ),
              ),
            );
          }

          return Container();
        });
  }
}
