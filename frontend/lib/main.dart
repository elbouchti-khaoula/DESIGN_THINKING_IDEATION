import 'package:flutter/material.dart';
import 'package:projet_pfa/Ideation_App/Ideation_App.dart';
import 'package:projet_pfa/Ideation_App/Add_Session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
      const ProviderScope(//A widget that stores the state of providers. All Flutter applications using Riverpod
        // must contain a ProviderScope at the root of their widget tree. It is done as followed:
        // void main () { runApp ( // Enabled Riverpod for the entire application ProviderScope
        // ( child: MyApp (), ), ); } It optionally
          child:CreateSessionApp()
          //child:IdeationApp()
      ));
}

