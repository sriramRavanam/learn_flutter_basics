import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> result;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    result = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            result.toString(),
          ),
        ),
      ),
    );
  }
}

Future<String> getData() async {
  var response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');
  return response.body;
}

/*
//Provider Shopping Cart
import 'package:flutter_application_learn/shoppingCart/models/catalog.dart';
import 'package:flutter_application_learn/shoppingCart/models/cart.dart';
import 'package:flutter_application_learn/shoppingCart/theme.dart';
import 'package:flutter_application_learn/shoppingCart/screens/login.dart';
import 'package:flutter_application_learn/shoppingCart/screens/catalog.dart';
import 'package:flutter_application_learn/shoppingCart/screens/cart.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Shopping Cart',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
*/

/*
//Json Testing - https://jsonplaceholder.typicode.com/posts
import 'package:flutter_application_learn/jsonTesting.dart';
import 'package:loading_animations/loading_animations.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jsonTesting',
      theme: ThemeData(accentColor: Colors.blueAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("json"),
        ),
        body: Container(
          child: Center(
            child: ListPost(),
          ),
        ),
      ),
    );
  }
}

class ListPost extends StatefulWidget {
  @override
  _ListPostState createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  Future<PostsList> posts;
  PostsList postsList;

  @override
  void initState() {
    super.initState();
    posts = fetchPost();
  }

  void setData(PostsList value) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        postsList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    posts.then((value) => setData(value));
    if (postsList == null)
      return Center(
        child: Container(
          child: LoadingBouncingLine.circle(),
        ),
      );

    return ListView.builder(
      cacheExtent: 20.00,
      itemCount: postsList.lists.length,
      itemBuilder: (context, index) {
        return new Card(
          child: ListTile(
            title: Text(postsList.lists[index].title),
            subtitle: Text(postsList.lists[index].body),
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('UserId: ${(postsList.lists[index].userId).toString()}'),
                Text('Id: ${(postsList.lists[index].id).toString()}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
*/
/*
//Profile page- UI challenges profile 1
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      theme: ThemeData(
          accentColor: Colors.amber[800], backgroundColor: Colors.orange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.red, debugLabel: "OH NO"),
        ),
      ),
      body: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            child: FlatButton(
              child: Center(
                child: Text("Profile"),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              ),
              splashColor: Colors.cyan,
              autofocus: true,
              padding: EdgeInsets.all(8.0),
            ),
          ),
        ),
        pictureRow,
      ],
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("View Profile"),
          backgroundColor: Colors.red,
          centerTitle: true),
      body: ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardList,
    );
  }
}

Image image = Image(
  image: AssetImage("assets/images/cat3.jpg"),
  fit: BoxFit.fill,
);
Widget pictureRow = Container(
  padding: EdgeInsets.all(20.0),
  decoration: BoxDecoration(
    color: Colors.red,
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.red,
        Colors.orange[200],
      ],
    ),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: ClipOval(
                child: Material(
                  color: Colors.red[600], // button color
                  child: InkWell(
                    splashColor: Colors.cyan, // inkwell color
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.phone),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child:
                  //Container(
                  //  decoration: BoxDecoration(
                  //    border: Border.all(width: 5.0, color: Colors.orange),
                  //    borderRadius: BorderRadius.all(
                  //      Radius.circular(56.0),
                  //   ),
                  //    color: Colors.orange,
                  //  ),
                  ClipOval(
                child: Material(
                  color: Colors.orange,
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange,
                        child: SizedBox(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("assets/images/cat3.jpg"),
                          ),
                          width: 112,
                          height: 112,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Center(
              child: ClipOval(
                child: Material(
                  color: Colors.red[600],
                  child: InkWell(
                    onTap: () => null,
                    splashColor: Colors.cyan,
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.message),
                    ),
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
      Container(
        child: Center(
          child: Column(
            children: [
              Text(
                "Sriram Ravanam",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "Bengaluru,Karnataka",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red[700],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget count = Row(
  children: [
    Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(color: Colors.orange[300]),
        child: Center(
          child: Column(
            children: [
              Text(
                "50895",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Text(
                "FOLLOWERS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
          child: Column(
            children: [
              Text(
                "34524",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                "FOLLOWING",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);

Widget cardList = ListView(
  children: <Widget>[
    pictureRow,
    count,
    ListTile(
      title: Text(
        "Email",
        style: TextStyle(color: Colors.red, fontSize: 12),
      ),
      subtitle: Text(
        "sriramravanam@gmail.com",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
    Divider(),
    ListTile(
      title: Text(
        "Phone",
        style: TextStyle(color: Colors.red, fontSize: 12),
      ),
      subtitle: Text(
        "6361357255",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
    Divider(),
    ListTile(
      title: Text(
        "Insta",
        style: TextStyle(color: Colors.red, fontSize: 12),
      ),
      subtitle: Text(
        "ravana_maou_sama",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
    Divider(),
  ],
);

*/

/*

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      title: "Animation",
    );
  }
}

class MyHome extends StatelessWidget {
  final Image image = Image(
    image: AssetImage("assets/images/cat3.jpg"),
    fit: BoxFit.cover,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Animations(image: image),
        ),
      ),
    );
  }
}

class Animations extends StatefulWidget {
  final Image image;
  Animations({this.image});
  @override
  _AnimationsState createState() => _AnimationsState(image: image);
}

class _AnimationsState extends State<Animations> {
  Image image;
  _AnimationsState({this.image});
  double _width = 300;
  double _widthend = 100;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 100, end: 800),
      duration: Duration(seconds: 15),
      builder: (BuildContext _, double _width, Widget __) {
        return Container(
          child: image,
          width: _width,
        );
      },
    );
  }
}

*/

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("INTERACTIONS IN FLUTTER"),
            centerTitle: true,
          ),
          body: Center(
            child: ParentWidget(),
          )),
    );
  }
}

//---------------------------- ParentWidget ----------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return GestureDetector(
      onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
*/

/* FLOATING ACTION INCREMENT
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateful Demo",
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int i = 0;
  void _increment() {
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action increment"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Count: $i"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
*/

/*  TRAVEL APP PAGE
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "layout demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
          centerTitle: true,
        ),
        body: ListView(
          children: [im, titleBar, buttonRow, textSection],
        ),
      ),
    );
  }
}

Image im = new Image(
  image: AssetImage(
    'assets/images/cat3.jpg',
  ),
  fit: BoxFit.cover,
);

Widget titleBar = Container(
  padding: EdgeInsets.all(32),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "Title of the Place",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Location of Place",
              style: TextStyle(color: Colors.grey[350]),
            )
          ],
        ),
      ),
/*      Icon(
        Icons.currentIcon,
        color: Colors.orange[900],
      ),
      Text(
        "$favCount",
        style: TextStyle(color: Colors.orange[900]),
      ),*/
      _FavouritedWidget(),
    ],
  ),
);

Color col = Colors.blue;
Widget buttonRow = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildIconHelper(col, Icons.call, 'CALL'),
      _buildIconHelper(col, Icons.near_me, 'ROUTE'),
      _buildIconHelper(col, Icons.share, 'SHARE'),
    ],
  ),
);

Column _buildIconHelper(Color color, IconData icon, String label) {
  return Column(
    children: [
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              color: color, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      )
    ],
  );
}

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

class _FavouritedWidget extends StatefulWidget {
  @override
  __FavouritedWidgetState createState() => __FavouritedWidgetState();
}

class __FavouritedWidgetState extends State<_FavouritedWidget> {
  bool _isFav = false;
  int _favCount = 50;
  IconData currentIcon = Icons.star_outline;

  void _icontap() {
    setState(() {
      _isFav = _isFav ? false : true;
      currentIcon = _isFav ? Icons.star : Icons.star_outline;
      _favCount = _isFav ? _favCount + 1 : _favCount - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            currentIcon,
            color: Colors.orange[700],
          ),
          Text("$_favCount"),
        ],
      ),
      onPressed: _icontap,
    );
  }
}
*/

/*HECK IF I KNOW

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
