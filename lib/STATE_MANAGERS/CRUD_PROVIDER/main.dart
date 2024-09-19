import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skills/STATE_MANAGERS/CRUD_PROVIDER/controller_provider.dart';
import 'package:skills/STATE_MANAGERS/CRUD_PROVIDER/crud_page_provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ControllerProvider()),
      ],
      child: MaterialApp(home: CrudPageProvider()),
    ));
