import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = SideMenuController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            SideMenu(
              controller: _controller,
              backgroundColor: Colors.grey.shade900,
              mode: SideMenuMode.open,
              hasResizer: false,
              hasResizerToggle: false,
              builder: (data) {
                return SideMenuData(
                  header: const Text(
                    'Header / logo',
                    style: TextStyle(color: Colors.amber),
                  ),
                  customChild: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      data.isOpen
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SizedBox(
                                //color: Colors.orange,
                                height: 35,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text('New chat'),
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            )
                          : const Center(
                              child: InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 10.0),
                      //   child: Text(
                      //     'Recent',
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //         color: Colors.white, fontWeight: FontWeight.w800),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.transparent,
                          child: ListView.builder(
                            //controller: ScrollController(),
                            itemCount: 50,
                            //reverse: true,
                            //shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 15),
                                  child: Text(
                                    'Recent',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: data.isOpen ? 14 : 8,
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SizedBox(
                                    //color: Colors.orange,
                                    height: 35,
                                    child: data.isOpen
                                        ? ElevatedButton.icon(
                                            onPressed: () {},
                                            label: Text(
                                              '$index - chat text aici, bla bla si cu bla bla bla',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            icon: const Icon(
                                              Icons.messenger_outline,
                                            ),
                                          )
                                        : const InkWell(
                                            child: Icon(
                                              Icons.messenger_outline,
                                              color: Colors.white,
                                              size: 10,
                                            ),
                                          ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  customWidgetFlex: 2,
                  withSpacing: false,
                  spacingFlex: 1,
                  items: [
                    //const SideMenuItemDataTitle(title: 'Section Header'),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 0,
                      onTap: () => setState(() => _currentIndex = 0),
                      title: 'Item 1',
                      hoverColor: Colors.blue,
                      titleStyle: const TextStyle(color: Colors.white),
                      icon: const Icon(Icons.home_outlined),
                      selectedIcon: const Icon(Icons.home),
                      badgeStyle: const BadgeStyle(badgeColor: Colors.red),
                      badgeContent: const Text(
                        '23',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 1,
                      onTap: () => setState(() => _currentIndex = 1),
                      title: 'Item 2',
                      selectedTitleStyle: const TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.yellow),
                      icon: const Icon(Icons.table_bar_outlined),
                      selectedIcon: const Icon(Icons.table_bar),
                      titleStyle:
                          const TextStyle(color: Colors.deepPurpleAccent),
                    ),
                    // const SideMenuItemDataTitle(
                    //   title: 'Account',
                    //   textAlign: TextAlign.center,
                    // ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 2,
                      onTap: () => setState(() => _currentIndex = 2),
                      title: 'Item 3',
                      icon: const Icon(Icons.play_arrow),
                    ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 3,
                      onTap: () => setState(() => _currentIndex = 3),
                      title: 'Item 4',
                      icon: const Icon(Icons.car_crash),
                    ),
                  ],
                  footer: Container(
                    color: Colors.transparent,
                    height: 50,
                    child: const Text(
                      'Footer',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'body',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.toggle();
                      },
                      child: const Text('change side menu state'),
                    )
                  ],
                ),
              ),
            ),
            // SideMenu(
            //   position: SideMenuPosition.right,
            //   builder: (data) => const SideMenuData(
            //     customChild: Text('custom view'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
