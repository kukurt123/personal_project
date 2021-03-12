import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/qr_bloc.dart';
import 'package:new_practice/repo/page1_1_repo.dart';
import 'package:new_practice/routing/routing.dart';
import 'package:new_practice/screens/main_drawer.dart';
import 'package:new_practice/screens/uber/login/sign-in-manager.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:sizer/sizer.dart';
import 'bloc/main_bloc.dart';
import 'bloc/page1_1/page1_1_barrel.dart';
import 'bloc/page1_3/page1_3rx.dart';
import 'bloc/uber_bloc/uber-user_bloc.dart';
import 'models/uber_model/email-sign-in-change.model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(ModularApp(
    module: AppModule(),
  ));
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          SizerUtil().init(constraints, orientation);
          return MaterialApp(
            initialRoute: true != false ? "/main" : "/main",
            navigatorKey: Modular.navigatorKey,
            onGenerateRoute: Modular.generateRoute,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        },
      );
    });
  }
}

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => Page1Bloc(repo: new Page1Repository())),
        Bind((i) => Page1_3rx(), singleton: true),
        Bind((i) => MainBloc()),
        Bind((i) => AuthService()),
        Bind((i) => SignInManager()),
        Bind((i) => EmailSignInChangeModel(), singleton: false),
        Bind((i) => QrBloc()),
        Bind((i) => UberUserBloc()),
      ];
  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => routing();
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
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
        onPressed: null,
        tooltip: 'Increment',
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}
