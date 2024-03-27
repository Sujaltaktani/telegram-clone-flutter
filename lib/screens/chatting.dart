import 'dart:convert';

import 'package:flutter/material.dart';

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

    // Make HTTP POST request to the API endpoint
    // Replace the API response with the actual API response from your server
    final List<dynamic> apiResponse = json.decode('''
    [
        {
            "candidates": [
                {
                    "content": {
                        "parts": [
                            {
                                "text": "I don't have access to your personal information, so I cannot tell you"
                            }
                        ],
                        "role": "model"
                    },
                    "finishReason": "STOP",
                    "index": 0,
                    "safetyRatings": [
                        {
                            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                            "probability": "NEGLIGIBLE"
                        },
                        {
                            "category": "HARM_CATEGORY_HATE_SPEECH",
                            "probability": "NEGLIGIBLE"
                        },
                        {
                            "category": "HARM_CATEGORY_HARASSMENT",
                            "probability": "NEGLIGIBLE"
                        },
                        {
                            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                            "probability": "NEGLIGIBLE"
                        }
                    ]
                }
            ],
            "promptFeedback": {
                "safetyRatings": [
                    {
                        "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                        "probability": "NEGLIGIBLE"
                    },
                    {
                        "category": "HARM_CATEGORY_HATE_SPEECH",
                        "probability": "NEGLIGIBLE"
                    },
                    {
                        "category": "HARM_CATEGORY_HARASSMENT",
                        "probability": "NEGLIGIBLE"
                    },
                    {
                        "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                        "probability": "NEGLIGIBLE"
                    }
                ]
            }
        },
        {
            "candidates": [
                {
                    "content": {
                        "parts": [
                            {
                                "text": " your name."
                            }
                        ],
                        "role": "model"
                    },
                    "finishReason": "STOP",
                    "index": 0,
                    "safetyRatings": [
                        {
                            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                            "probability": "NEGLIGIBLE"
                        },
                        {
                            "category": "HARM_CATEGORY_HATE_SPEECH",
                            "probability": "NEGLIGIBLE"
                        },
                        {
                            "category": "HARM_CATEGORY_HARASSMENT",
                            "probability": "NEGLIGIBLE"
                        },
                        {
                            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                            "probability": "NEGLIGIBLE"
                        }
                    ]
                }
            ]
        }
    ]
    ''');

    for (var item in apiResponse) {
      final candidates = item['candidates'] as List<dynamic>;
      for (var candidate in candidates) {
        final content = candidate['content'];
        final parts = content['parts'] as List<dynamic>;
        for (var part in parts) {
          setState(() {
            messages.add(Message(part['text'], false)); // Add API response
          });
        }
      }
    }
  }
}

class Message {
  final String text;
  final bool isUserMessage;

  Message(this.text, this.isUserMessage);
}
