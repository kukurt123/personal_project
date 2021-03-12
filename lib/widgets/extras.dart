import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/page1_1/page1_1_barrel.dart';

class SplashEffect extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const SplashEffect({Key key, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: child,
        onTap: onTap,
      ),
    );
  }
}

// Widget CreateDrawerItem(
//     {IconData icon, String text, GestureTapCallback onTap}) {}

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;
  final String routeName;
  final bool withFunc;

  const DrawerListItem(
      {Key key,
      this.icon,
      this.text,
      this.onTap,
      this.withFunc = false,
      this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: () {
        if (this.withFunc) {
          print('with func');
          this.onTap();
        }
        Navigator.pop(context);
        Modular.to.pushReplacementNamed(this.routeName);
        // if (onTap()) {
        // }
      },
    );
  }
}

class Extras {
  static navigate(BuildContext context, String routeName) {
    Navigator.pop(context);
    Modular.to.pushReplacementNamed(routeName);
  }
}
