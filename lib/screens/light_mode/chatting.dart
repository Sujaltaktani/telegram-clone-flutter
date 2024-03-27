import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(messages[index]);
              },
            ),
          ),
          _buildMessageInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Align(
      alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: message.isUserMessage ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(message.text),
        ),
      ),
    );
  }

  Widget _buildMessageInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              _sendMessage(_textEditingController.text);
            },
            child: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message) async {
    setState(() {
      messages.add(Message(message, true)); // Add user's message
      _textEditingController.clear(); // Clear text field
    });

    // Define the API endpoint URL
    var apiUrl = 'https://generativelanguage.googleapis.com/v1/models/gemini-pro:streamGenerateContent?key=AIzaSyBUA19PoTh7qUmJPnpDiow5n7R2lvIHCKM';

    // Define the request body
    var requestBody = json.encode({
      "contents": [
        {
          "role": "user",
          "parts": [{"text": message}]
        }
      ]
    });

    // Make the HTTP POST request
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the response JSON
      var responseBody = json.decode(response.body);

      // Extract the API response text from the JSON and add it to the messages list
      if (responseBody is List && responseBody.isNotEmpty) {
        var candidates = responseBody[0]['candidates'] as List;
        if (candidates.isNotEmpty) {
          var content = candidates[0]['content'];
          var parts = content['parts'] as List;
          if (parts.isNotEmpty) {
            var apiResponseText = parts[0]['text'];
            setState(() {
              messages.add(Message(apiResponseText, false)); // Add API response
            });
          }
        }
      }
    } else {
      // Handle the error if the request fails
      print('Error: ${response.statusCode}');
    }
  }
}

class Message {
  final String text;
  final bool isUserMessage;

  Message(this.text, this.isUserMessage);
}
