import 'package:flutter/material.dart';

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
    padding: EdgeInsets.all(25),
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory App'),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                mySnackBar("This is comments", context);
              },
              icon: const Icon(Icons.comment)),
          IconButton(
              onPressed: () {
                mySnackBar("This is search", context);
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                mySnackBar("This is settings", context);
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                mySnackBar("This is email", context);
              },
              icon: const Icon(Icons.email)),
        ],
      ),

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(20),child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'First Name')),),
          Padding(padding: EdgeInsets.all(20),child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Last Name')),),
        ],
      ),

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
                    mySnackBar(
                        'drawer profile click the rej  jdnds n as c', context);
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
                    mySnackBar(
                        'drawer profile click the rej  jdnds n as c', context);
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
    );
  }
}





















// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
