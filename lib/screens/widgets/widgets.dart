import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';

import '../../components/drawer/drawer.dart';
import '../../store/main.dart';

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({super.key});

  @override
  State<WidgetsScreen> createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();

    return Scaffold(
        appBar: AppBarComponent("Home", shouldLeadingShow: false),
        drawer: const DrawerMenuComponent(),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('FlatButton 1'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('FlatButton 2'),
                      ),
                    ],
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Radio(
                    value: 'option1',
                    groupValue: 'option1',
                    onChanged: (value) {},
                  ),
                  Slider(
                    value: 0.5,
                    onChanged: (value) {},
                  ),
                  const CircularProgressIndicator(),
                  Stepper(
                    currentStep: 0,
                    steps: const [
                      Step(
                        title: Text('Step 1'),
                        content: Text('Step 1 Content'),
                      ),
                      Step(
                        title: Text('Step 2'),
                        content: Text('Step 2 Content'),
                      ),
                    ],
                  ),
                  DropdownButton(
                    value: 'option1',
                    onChanged: (value) {},
                    items: const [
                      DropdownMenuItem(
                        value: 'option1',
                        child: Text('Option 1'),
                      ),
                      DropdownMenuItem(
                        value: 'option2',
                        child: Text('Option 2'),
                      ),
                    ],
                  ),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        label: Text('Chip 1'),
                      ),
                      Chip(
                        label: Text('Chip 2'),
                      ),
                      Chip(
                        label: Text('Chip 3'),
                      ),
                      Chip(
                        label: Text('Chip 4'),
                      ),
                    ],
                  ),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          Text('Cell 1'),
                          Text('Cell 2'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Cell 3'),
                          Text('Cell 4'),
                        ],
                      ),
                    ],
                  ),
                  const Tooltip(
                    message: 'Tooltip Message',
                    child: Text('Tooltip Widget'),
                  ),
                  Dismissible(
                    key: UniqueKey(),
                    child: const ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Dismissible Widget'),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text('MaterialButton'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
