import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class Activity2 extends StatefulWidget {
  final String msg;

  const Activity2(this.msg, {Key? key}) : super(key: key);

  @override
  _Activity2State createState() => _Activity2State();
}

class _Activity2State extends State<Activity2> {
  List<dynamic> posts = []; // To store fetched data
  bool isLoading = true; // To handle loading state

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Fetch data from API
  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        mySnackBar("Data fetched successfully", context);

        setState(() {
          posts = data; // Decode and store data
          isLoading = false; // Stop loading indicator
        });
      } else {
        mySnackBar("Error: ${response.statusCode} - ${response.reasonPhrase}", context);
      }
    } catch (e) {
      mySnackBar("An error occurred: $e", context);
    } finally {
      setState(() {
        isLoading = false; // Ensure loading indicator is stopped
      });
      // mySnackBar("Fetch attempt completed", context);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.msg),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loader while fetching data
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: posts.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onDoubleTap: () {},
                  onLongPress: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          post['title'],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          post['body'],
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}