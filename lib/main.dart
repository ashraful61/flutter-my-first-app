import 'package:flutter/material.dart';
import 'package:my_demo/components/ActivityTwo.dart';
import 'Fragment/AlarmFragment.dart';
import 'Fragment/HomeFragment.dart';
import 'Fragment/NotificationsFragment.dart';
import 'Fragment/ProfileFragment.dart';
import 'Fragment/SearchFragment.dart';
import 'Fragment/SettingsFragment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding

main() {
  runApp(const MyApp()); //Aplication
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget {
  HomeActivity({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  myAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: const Text('Alert!'),
            content: const Text('Do you want to delete'),
            actions: [
              TextButton(
                  onPressed: () {
                    // mySnackBar('Yes button clicked', context);
                    // Navigator.pop(context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    mySnackBar('Cancel button clicked', context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
            ],
          ));
        });
  }

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.lime,
      padding: const EdgeInsets.all(16),
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      minimumSize: const Size(double.infinity, 42));

  var myItems = [
    {
      "_id": "67568d34f67669c9fb21cee6",
      "index": 0,
      "guid": "89913945-79c3-4e95-b1e2-2b1e8f680862",
      "isActive": false,
      "picture": "http://placehold.it/32x32",
      "age": 33,
      "eyeColor": "green",
      "name": "Krystal Stark",
      "gender": "female",
      "company": "LUNCHPOD",
      "email": "krystalstark@lunchpod.com",
      "phone": "+1 (968) 461-3820",
      "address": "531 Jackson Court, Maybell, Marshall Islands, 1096",
      "about":
          "Elit cupidatat voluptate adipisicing et nulla elit quis est sint ea cillum in. Quis minim eu reprehenderit sint aliqua labore ex aliquip in commodo et. Consequat tempor incididunt pariatur quis officia fugiat voluptate mollit laboris duis laboris ut. Velit occaecat eu et sit excepteur laborum ad reprehenderit exercitation elit ea. Consequat anim ullamco sunt reprehenderit ea irure non consequat commodo dolore. Ullamco id ad anim veniam excepteur Lorem aliquip dolor elit esse sit.\r\n",
      "registered": "2023-12-07T12:10:23 -06:00",
      "latitude": 52.977314,
      "longitude": 176.52986,
      "tags": [
        "laboris",
        "laborum",
        "ex",
        "ullamco",
        "labore",
        "ea",
        "reprehenderit"
      ],
      "friends": [
        {"id": 0, "name": "Estella Lara"},
        {"id": 1, "name": "Eva Brown"},
        {"id": 2, "name": "Moses Haley"}
      ],
      "greeting": "Hello, Krystal Stark! You have 3 unread messages.",
      "favoriteFruit": "strawberry"
    },
    {
      "_id": "67568d344b590b1faaa9c532",
      "index": 1,
      "guid": "31906222-afa3-49b0-a0ab-b6195309cc8c",
      "isActive": true,
      "picture": "http://placehold.it/32x32",
      "age": 35,
      "eyeColor": "blue",
      "name": "Helene Schultz",
      "gender": "female",
      "company": "ENDIPIN",
      "email": "heleneschultz@endipin.com",
      "phone": "+1 (886) 446-3016",
      "address": "827 Louise Terrace, Wauhillau, Indiana, 4003",
      "about":
          "Quis ad excepteur esse voluptate anim nulla aliqua velit dolor exercitation non excepteur ipsum exercitation. Irure in aute commodo id dolore culpa deserunt esse aliquip dolor nostrud. Consequat exercitation aliqua quis ut ea. Voluptate et culpa dolor non adipisicing ad exercitation qui Lorem laborum incididunt incididunt. Fugiat eiusmod commodo anim sint eiusmod dolor sit amet aliquip qui eiusmod officia nulla. Sit ullamco ad fugiat aliquip in pariatur consectetur Lorem pariatur minim consequat tempor excepteur. Aliqua irure minim in ut ullamco tempor sint anim aliqua.\r\n",
      "registered": "2014-05-07T08:15:41 -06:00",
      "latitude": -14.309298,
      "longitude": -128.798164,
      "tags": [
        "amet",
        "pariatur",
        "dolor",
        "ad",
        "irure",
        "incididunt",
        "irure"
      ],
      "friends": [
        {"id": 0, "name": "Nixon Goodwin"},
        {"id": 1, "name": "Wells Holmes"},
        {"id": 2, "name": "Jackie Rivers"}
      ],
      "greeting": "Hello, Helene Schultz! You have 9 unread messages.",
      "favoriteFruit": "apple"
    },
    {
      "_id": "67568d357b253d48fc5b75fb",
      "index": 2,
      "guid": "dc1a46a9-ae84-48d2-8b5f-baf3e476667c",
      "isActive": false,
      "picture": "http://placehold.it/32x32",
      "age": 29,
      "eyeColor": "green",
      "name": "Powell Maxwell",
      "gender": "male",
      "company": "FARMAGE",
      "email": "powellmaxwell@farmage.com",
      "phone": "+1 (873) 521-3879",
      "address": "990 Middagh Street, Imperial, Montana, 6762",
      "about":
          "Nostrud pariatur magna enim aliquip esse magna voluptate nisi ea cillum sit. Excepteur anim duis amet ipsum. Irure amet quis dolor magna ullamco nisi. Officia in incididunt quis sunt officia eiusmod id non reprehenderit. Est amet aliqua eu non elit et minim velit adipisicing occaecat. Sunt consectetur id fugiat nostrud aute.\r\n",
      "registered": "2017-07-19T03:36:49 -06:00",
      "latitude": -35.580726,
      "longitude": 30.660805,
      "tags": [
        "commodo",
        "pariatur",
        "Lorem",
        "tempor",
        "proident",
        "excepteur",
        "ad"
      ],
      "friends": [
        {"id": 0, "name": "Angelique Johnston"},
        {"id": 1, "name": "Heidi Tran"},
        {"id": 2, "name": "Cervantes Fulton"}
      ],
      "greeting": "Hello, Powell Maxwell! You have 3 unread messages.",
      "favoriteFruit": "banana"
    },
    {
      "_id": "67568d35aa3bb2e677755927",
      "index": 3,
      "guid": "76e805cb-51a9-401a-a703-6a2f1e4c7ec1",
      "isActive": false,
      "picture": "http://placehold.it/32x32",
      "age": 22,
      "eyeColor": "blue",
      "name": "Aguilar Gibson",
      "gender": "male",
      "company": "ZOINAGE",
      "email": "aguilargibson@zoinage.com",
      "phone": "+1 (950) 572-3310",
      "address": "325 Monaco Place, Yogaville, American Samoa, 3553",
      "about":
          "Officia cillum eiusmod nulla commodo. Id reprehenderit reprehenderit nulla enim excepteur consectetur culpa voluptate ipsum tempor eiusmod. Quis sunt in amet eiusmod nisi dolore ex aliqua voluptate quis elit. Incididunt officia ex laboris commodo enim nisi ad proident in proident. Quis consequat irure dolor cillum anim ut mollit id eiusmod. Voluptate incididunt consequat cillum est reprehenderit eiusmod anim.\r\n",
      "registered": "2022-12-03T04:17:39 -06:00",
      "latitude": 68.58117,
      "longitude": 83.635248,
      "tags": ["eu", "anim", "aliquip", "aliqua", "in", "ex", "id"],
      "friends": [
        {"id": 0, "name": "Gibson Black"},
        {"id": 1, "name": "Daisy York"},
        {"id": 2, "name": "Cantrell Calderon"}
      ],
      "greeting": "Hello, Aguilar Gibson! You have 5 unread messages.",
      "favoriteFruit": "apple"
    },
    {
      "_id": "67568d35a40fadde4403becd",
      "index": 4,
      "guid": "d3be38ea-4b09-4643-a18d-c49009f47cfb",
      "isActive": false,
      "picture": "http://placehold.it/32x32",
      "age": 31,
      "eyeColor": "blue",
      "name": "Palmer Lester",
      "gender": "male",
      "company": "CONFRENZY",
      "email": "palmerlester@confrenzy.com",
      "phone": "+1 (983) 558-2555",
      "address": "694 Bleecker Street, Carbonville, Kentucky, 6862",
      "about":
          "Et duis fugiat occaecat id dolore aliqua eiusmod occaecat. Tempor ea enim pariatur commodo est reprehenderit ea ad do. Nostrud consectetur ea est nulla in do. Labore labore elit voluptate culpa. Laboris quis ullamco nostrud ullamco ad ipsum tempor incididunt amet ipsum.\r\n",
      "registered": "2021-09-10T03:41:31 -06:00",
      "latitude": 55.270478,
      "longitude": 147.289821,
      "tags": [
        "ea",
        "magna",
        "esse",
        "velit",
        "laboris",
        "dolor",
        "consectetur"
      ],
      "friends": [
        {"id": 0, "name": "Cecilia Valentine"},
        {"id": 1, "name": "Acosta Dominguez"},
        {"id": 2, "name": "Mcdaniel Munoz"}
      ],
      "greeting": "Hello, Palmer Lester! You have 6 unread messages.",
      "favoriteFruit": "banana"
    },
    {
      "_id": "67568d353372676d2777ddfd",
      "index": 5,
      "guid": "fc3104ec-0bc4-483c-af75-fc065af4dd9c",
      "isActive": false,
      "picture": "http://placehold.it/32x32",
      "age": 27,
      "eyeColor": "green",
      "name": "Byers Sutton",
      "gender": "male",
      "company": "BESTO",
      "email": "byerssutton@besto.com",
      "phone": "+1 (976) 441-2729",
      "address": "868 Eldert Lane, Grenelefe, California, 7901",
      "about":
          "Tempor cillum ex labore sit fugiat nisi eiusmod tempor esse. Officia pariatur adipisicing dolor consectetur proident aliquip. Ad excepteur amet ex ullamco enim proident pariatur eiusmod. Anim dolore duis aute sit. Tempor pariatur in cupidatat mollit irure dolor nisi culpa quis enim laboris culpa commodo. Exercitation ad nulla ipsum aliquip tempor sunt cupidatat est officia veniam elit tempor eiusmod.\r\n",
      "registered": "2021-11-29T03:03:29 -06:00",
      "latitude": -29.495982,
      "longitude": -42.419735,
      "tags": ["id", "labore", "sit", "laborum", "sunt", "ex", "ea"],
      "friends": [
        {"id": 0, "name": "Kasey Bartlett"},
        {"id": 1, "name": "Cross Mccray"},
        {"id": 2, "name": "Celeste Castillo"}
      ],
      "greeting": "Hello, Byers Sutton! You have 10 unread messages.",
      "favoriteFruit": "banana"
    },
    {
      "_id": "67568d35eabf14d7feff3d80",
      "index": 6,
      "guid": "9140a5e0-1c80-4978-959c-acd6d424096d",
      "isActive": false,
      "picture": "http://placehold.it/32x32",
      "age": 35,
      "eyeColor": "blue",
      "name": "Jenkins Bennett",
      "gender": "male",
      "company": "BLUPLANET",
      "email": "jenkinsbennett@bluplanet.com",
      "phone": "+1 (947) 414-2158",
      "address": "392 Macon Street, Cherokee, Florida, 8072",
      "about":
          "Ad laboris qui deserunt fugiat nulla sint Lorem reprehenderit aliqua ea ipsum et. Voluptate nisi amet cillum exercitation dolore excepteur laboris quis minim labore officia Lorem cillum tempor. Exercitation incididunt pariatur in veniam adipisicing elit dolore aliqua sint occaecat ea aute. Laborum ex Lorem culpa sit elit irure fugiat dolor. Adipisicing esse excepteur amet enim do voluptate nostrud magna. Ut tempor culpa et aliqua consectetur ex.\r\n",
      "registered": "2023-02-13T06:36:42 -06:00",
      "latitude": -86.284418,
      "longitude": -43.10337,
      "tags": [
        "pariatur",
        "nisi",
        "qui",
        "veniam",
        "reprehenderit",
        "minim",
        "fugiat"
      ],
      "friends": [
        {"id": 0, "name": "Nellie Berg"},
        {"id": 1, "name": "Mcmahon Carson"},
        {"id": 2, "name": "Blair Hopkins"}
      ],
      "greeting": "Hello, Jenkins Bennett! You have 7 unread messages.",
      "favoriteFruit": "apple"
    }
  ];

  fetchData() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo App'),
          titleSpacing: 0,
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {
                mySnackBar("This is comments dfsd", context);
              },
              icon: const Icon(Icons.comment),
            ),
            IconButton(
              onPressed: () {
                mySnackBar("This is search", context);
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                mySnackBar("This is settings", context);
              },
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {
                mySnackBar("This is email", context);
              },
              icon: const Icon(Icons.email),
            ),
          ],
          // bottom: const TabBar(
          //   isScrollable: true,
          //   indicatorPadding: EdgeInsets.zero, // Aligns the indicator
          //   padding: EdgeInsets.zero, // Removes extra padding
          //   tabs: [
          //     Tab(icon: Icon(Icons.home), text: 'Home'),
          //     Tab(icon: Icon(Icons.search), text: 'Search'),
          //     Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
          //     Tab(icon: Icon(Icons.settings), text: 'Settings'),
          //     Tab(icon: Icon(Icons.person), text: 'Profile'),
          //     Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
          //   ],
          // ),
        ),

        // body: GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     crossAxisSpacing: 10,
        //   ),
        //   itemCount: myItems.length,
        //   padding: const EdgeInsets.all(10),
        //   itemBuilder: (context, index) {
        //     return GestureDetector(
        //       onDoubleTap: () {
        //         mySnackBar('double tap: ${myItems[index]['name']}', context);
        //       },
        //       onLongPress: () {
        //         mySnackBar('Longpress tap: ${myItems[index]['name']}', context);
        //       },
        //       child: Container(
        //           margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        //           width: double.infinity,
        //           height: 200,
        //           child: Image.network(
        //             myItems[index]['picture'] as String,
        //             fit: BoxFit.fill,
        //           )),
        //     );
        //   },
        // ),

        // body: Center(
        //   child: Card(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(100)),
        //     shadowColor: const Color.fromRGBO(176, 234, 205, 1),
        //     color: const Color.fromRGBO(33, 191, 115, 1),
        //     elevation: 10,
        //     child: const SizedBox(
        //       height: 200,
        //       width: 200,
        //       child: Center(
        //         child: Text("This is card"),
        //       ),
        //     ),
        //   ),
        // ),

        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Activity1('Dynamic activity one')),
                  );
                },
                child: Text('Go To Activity one')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Activity2('Dynamic Activity Two')),
                  );
                },
                child: Text('Go To Activity two')),
          ],
        ),

        // body: TabBarView(
        //   children: [
        //     HomeFragment(),
        //     SearchFragment(),
        //     NotificationsFragment(),
        //     SettingsFragment(),
        //     ProfileFragment(),
        //     AlarmFragment(),
        //   ],
        // ),

        // body: GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     crossAxisSpacing: 10,
        //   ),
        //   itemCount: myItems.length,
        //   padding: const EdgeInsets.all(10),
        //   itemBuilder: (context, index) {
        //     return GestureDetector(
        //       onDoubleTap: () {
        //         mySnackBar('double tap: ${myItems[index]['name']}', context);
        //       },
        //       onLongPress: () {
        //         mySnackBar('Longpress tap: ${myItems[index]['name']}', context);
        //       },
        //       child: Container(
        //           margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        //           width: double.infinity,
        //           height: 200,
        //           child: Image.network(
        //             myItems[index]['picture'] as String,
        //             fit: BoxFit.fill,
        //           )),
        //     );
        //   },
        // ),

        // body: ListView.builder(
        //   itemCount: myItems.length,
        //   itemBuilder: (context, index) {
        //     return GestureDetector(
        //       onDoubleTap: () {
        //         mySnackBar('double tap: ${myItems[index]['name']}', context);
        //       },
        //       onLongPress: () {
        //         mySnackBar('Longpress tap: ${myItems[index]['name']}', context);
        //       },
        //       child: Container(
        //           margin: const EdgeInsets.all(10),
        //           width: double.infinity,
        //           height: 200,
        //           child: Image.network(
        //             myItems[index]['picture'] as String,
        //             fit: BoxFit.fill,
        //           )),
        //     );
        //   },
        // ),

        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     const Padding(
        //         padding: EdgeInsets.all(20),
        //         child: TextField(
        //             decoration: InputDecoration(
        //                 border: OutlineInputBorder(), labelText: 'First Name'))),
        //     const Padding(
        //         padding: EdgeInsets.all(20),
        //         child: TextField(
        //             decoration: InputDecoration(
        //                 border: OutlineInputBorder(), labelText: 'Last Name'))),
        //     const Padding(
        //         padding: EdgeInsets.all(20),
        //         child: TextField(
        //             decoration: InputDecoration(
        //                 border: OutlineInputBorder(),
        //                 labelText: 'Email Address'))),
        //     Padding(
        //         padding: const EdgeInsets.all(20),
        //         child: ElevatedButton(
        //             onPressed: () {
        //               mySnackBar('submit button', context);
        //             },
        //             style: buttonStyle,
        //             child: const Text('Submit'))),
        //   ],
        // ),

        // body: Padding(
        //   padding: const EdgeInsets.only(top: 16), // Add 16px padding to the top
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       TextButton(
        //         onPressed: () {
        //           mySnackBar('My text button', context);
        //         },
        //         child: Text("My First Button"),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           // mySnackBar('My Elevated text button', context);
        //           myAlertDialog(context);
        //         },
        //         child: Text("Elevated"),
        //         style: buttonStyle,
        //       ),
        //       OutlinedButton(
        //         onPressed: () {
        //           mySnackBar('My Outlined text button', context);
        //         },
        //         child: Text("Outlined button"),
        //       ),
        //     ],
        //   ),
        // ),

        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Image.network(
        //           "https://scontent.fdac24-5.fna.fbcdn.net/v/t39.30808-1/462359931_2536634103197305_2644017095845672623_n.jpg?stp=cp0_dst-jpg_p40x40_tt6&_nc_cat=102&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeHdAseo9FPn2wUqYDautLpmGS3EgLyxypMZLcSAvLHKkx7bSyT6vA0-zKCh-9jf6MEbKNW_VxC29ESx-ypNT0dg&_nc_ohc=y9lJQJwd8wQQ7kNvgFWm_uR&_nc_zt=24&_nc_ht=scontent.fdac24-5.fna&_nc_gid=APrmn3U2QP6I54ZNNZMZ4uX&oh=00_AYCvHWDFDDNQRS-QYxWIery893gp0sjZEelZQozF7BA4xQ&oe=675B3658"),
        //     ),
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Image.network(
        //           "https://scontent.fdac24-5.fna.fbcdn.net/v/t39.30808-1/462359931_2536634103197305_2644017095845672623_n.jpg?stp=cp0_dst-jpg_p40x40_tt6&_nc_cat=102&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeHdAseo9FPn2wUqYDautLpmGS3EgLyxypMZLcSAvLHKkx7bSyT6vA0-zKCh-9jf6MEbKNW_VxC29ESx-ypNT0dg&_nc_ohc=y9lJQJwd8wQQ7kNvgFWm_uR&_nc_zt=24&_nc_ht=scontent.fdac24-5.fna&_nc_gid=APrmn3U2QP6I54ZNNZMZ4uX&oh=00_AYCvHWDFDDNQRS-QYxWIery893gp0sjZEelZQozF7BA4xQ&oe=675B3658"),
        //     ),
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Image.network(
        //           "https://scontent.fdac24-5.fna.fbcdn.net/v/t39.30808-1/462359931_2536634103197305_2644017095845672623_n.jpg?stp=cp0_dst-jpg_p40x40_tt6&_nc_cat=102&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeHdAseo9FPn2wUqYDautLpmGS3EgLyxypMZLcSAvLHKkx7bSyT6vA0-zKCh-9jf6MEbKNW_VxC29ESx-ypNT0dg&_nc_ohc=y9lJQJwd8wQQ7kNvgFWm_uR&_nc_zt=24&_nc_ht=scontent.fdac24-5.fna&_nc_gid=APrmn3U2QP6I54ZNNZMZ4uX&oh=00_AYCvHWDFDDNQRS-QYxWIery893gp0sjZEelZQozF7BA4xQ&oe=675B3658"),
        //     ),
        //   ],
        // ),

        // body: Container(
        //   height: 250,
        //   width: 250,
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.fromLTRB(16, 34, 56, 12),
        //   padding: EdgeInsets.all(20),
        //   decoration: BoxDecoration(
        //       color: Colors.blue,
        //       border: Border.all(color: Colors.black, width: 6)),
        //   child: Image.network(
        //       "https://scontent.fdac24-5.fna.fbcdn.net/v/t39.30808-1/462359931_2536634103197305_2644017095845672623_n.jpg?stp=cp0_dst-jpg_p40x40_tt6&_nc_cat=102&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeHdAseo9FPn2wUqYDautLpmGS3EgLyxypMZLcSAvLHKkx7bSyT6vA0-zKCh-9jf6MEbKNW_VxC29ESx-ypNT0dg&_nc_ohc=y9lJQJwd8wQQ7kNvgFWm_uR&_nc_zt=24&_nc_ht=scontent.fdac24-5.fna&_nc_gid=APrmn3U2QP6I54ZNNZMZ4uX&oh=00_AYCvHWDFDDNQRS-QYxWIery893gp0sjZEelZQozF7BA4xQ&oe=675B3658"),
        // ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  padding: const EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(
                    accountName: const Text(
                      "Ashraful Islam",
                      style: TextStyle(color: Colors.blue),
                    ),
                    accountEmail: const Text("ashraful.ru37@gmail.com"),
                    decoration: const BoxDecoration(color: Colors.black),
                    currentAccountPicture: ClipOval(
                      child: Image.network(
                        "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                        fit: BoxFit
                            .cover, // Ensures the image covers the circular area properly
                      ),
                    ),
                    onDetailsPressed: () {
                      mySnackBar('drawer profile click the rej  jdnds n as c',
                          context);
                    },
                  )),
              ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    mySnackBar('Home list', context);
                  }),
              ListTile(
                  leading: const Icon(Icons.call),
                  title: const Text("Contact"),
                  onTap: () {
                    mySnackBar('Contact list', context);
                  }),
              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    mySnackBar('Profile list', context);
                  }),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(
                    accountName: const Text(
                      "Ashraful Islam",
                      style: TextStyle(color: Colors.blue),
                    ),
                    accountEmail: const Text("ashraful.ru37@gmail.com"),
                    decoration: const BoxDecoration(color: Colors.black),
                    currentAccountPicture: ClipOval(
                      child: Image.network(
                        "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                        fit: BoxFit
                            .cover, // Ensures the image covers the circular area properly
                      ),
                    ),
                    onDetailsPressed: () {
                      mySnackBar('drawer profile click the rej  jdnds n as c',
                          context);
                    },
                  )),
              ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    mySnackBar('Home list', context);
                  }),
              ListTile(
                  leading: const Icon(Icons.call),
                  title: const Text("Contact"),
                  onTap: () {
                    mySnackBar('Contact list', context);
                  }),
              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    mySnackBar('Profile list', context);
                  }),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Ensure this is set for 4 items
          currentIndex: 2,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          onTap: (int index) {
            if (index == 0) {
              mySnackBar('This is home', context);
            } else if (index == 1) {
              mySnackBar('This is shop', context);
            } else if (index == 2) {
              mySnackBar('This is profile', context);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            mySnackBar("Add button clicked", context);
          },
        ),
      ),
    );
  }
}

class Activity1 extends StatelessWidget {
  String msg;
  Activity1(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(msg),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Activity2('Dynamic activity using anoter')));
            },
            child: Text('Go to activity Two')),
      ),
    );
  }
}

// class Activity2 extends StatelessWidget {

//   String msg;
//   Activity2(this.msg, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(msg),
//       ),

//               body:

//     );
//   }
// }



// class Activity2 extends StatefulWidget {
//   final String msg;

//   const Activity2(this.msg, {Key? key}) : super(key: key);

//   @override
//   _Activity2State createState() => _Activity2State();
// }

// class _Activity2State extends State<Activity2> {
//   List<dynamic> posts = []; // To store fetched data
//   bool isLoading = true; // To handle loading state

//   mySnackBar(message, context) {
//     return ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Fetch data from API
//   Future<void> fetchData() async {
//     final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         mySnackBar("Data fetched successfully", context);

//         setState(() {
//           posts = data; // Decode and store data
//           isLoading = false; // Stop loading indicator
//         });
//       } else {
//         mySnackBar("Error: ${response.statusCode} - ${response.reasonPhrase}", context);
//       }
//     } catch (e) {
//       mySnackBar("An error occurred: $e", context);
//     } finally {
//       setState(() {
//         isLoading = false; // Ensure loading indicator is stopped
//       });
//       mySnackBar("Fetch attempt completed", context);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Fetch data on initialization
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.msg),
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator()) // Show loader while fetching data
//           : GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3, // 3 items per row
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: posts.length,
//               padding: const EdgeInsets.all(10),
//               itemBuilder: (context, index) {
//                 final post = posts[index];
//                 return GestureDetector(
//                   onDoubleTap: () {},
//                   onLongPress: () {},
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.green[100],
//                       border: Border.all(color: Colors.green, width: 1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           post['title'],
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           post['body'],
//                           textAlign: TextAlign.center,
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }