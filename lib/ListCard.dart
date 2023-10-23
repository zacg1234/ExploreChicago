import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  final Image thumbNail;
  final String title;
  final String address;

  const ListCard({super.key, required this.thumbNail, required this.title, required this.address});

  @override
  ListCardState createState() => ListCardState();
}

class ListCardState extends State<ListCard> {
  int thumbsUpCount = 0;
  int thumbsDownCount = 0;

  void _incrementThumbsUp() {
    setState(() {
      thumbsUpCount++;
    });
  }

  void _incrementThumbsDown() {
    setState(() {
      thumbsDownCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> {_showToast(context, widget.title)},
      child : Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 2.0,
          ),
        ),
        child: Column(

          children: [
            ListTile(
              title: Align(
                alignment: Alignment.topCenter,
                child: Text(widget.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              subtitle: Align(
                alignment: Alignment.topLeft,
                child: Text(widget.address,
                  maxLines: 2, // Limit text to 2 lines
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.topLeft,
                child:
                Container(
                  width: 200,
                  height: 200,
                  child:AspectRatio(
                    aspectRatio: 1.0,
                    child: widget.thumbNail,
                  ) ,
                )
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  _incrementThumbsUp();
                },
                iconSize: 30, // Set the icon size
                color: Colors.blueAccent, // Set the icon color
              ),
              Text(
                "$thumbsUpCount",
                style: const TextStyle(
                  fontSize: 24
                )
              ),

              const SizedBox(width: 20),

              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () {
                  _incrementThumbsDown();
                },
                iconSize: 30, // Set the icon size
                color: Colors.redAccent, // Set the icon color
              ),
              Text(
                  "$thumbsDownCount",
                  style: const TextStyle(
                      fontSize: 24
                  )
              )
            ],
          )

          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String title) {
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context) ;
    scaffold.showSnackBar(
        SnackBar(
          content: Text("You selected $title.",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          action: SnackBarAction(
              label: 'OK',
              onPressed: scaffold.hideCurrentSnackBar),
          duration: const Duration(seconds: 7),
        )
    ) ;
  }
}
