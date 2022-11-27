import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  final PageController controller;
  const BottomNavigationWidget({super.key, required this.controller});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NeumorphicRadio(
              style: const NeumorphicRadioStyle(
                  boxShape: NeumorphicBoxShape.circle()),
              value: 0,
              groupValue: pageState.currentPage,
              onChanged: (value) {
                pageState.changePage(value);
              },
              child: _buttonContainer(icon: const Icon(Icons.explore))),
          NeumorphicRadio(
              style: const NeumorphicRadioStyle(
                  boxShape: NeumorphicBoxShape.circle()),
              value: 1,
              groupValue: pageState.currentPage,
              onChanged: (value) {
                pageState.changePage(value);
              },
              child: _buttonContainer(icon: const Icon(Icons.category))),
          NeumorphicRadio(
              style: const NeumorphicRadioStyle(
                  boxShape: NeumorphicBoxShape.circle()),
              value: 2,
              groupValue: pageState.currentPage,
              onChanged: (value) {
                pageState.changePage(value);
              },
              child:
                  _buttonContainer(icon: const Icon(Icons.favorite_outline))),
          NeumorphicRadio(
              style: const NeumorphicRadioStyle(
                  boxShape: NeumorphicBoxShape.circle()),
              value: 3,
              groupValue: pageState.currentPage,
              onChanged: (value) {
                pageState.changePage(value);
              },
              child: _buttonContainer(icon: const Icon(Icons.info_sharp))),
        ],
      ),
    );
  }

  _buttonContainer({required Icon icon}) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: icon,
    );
  }
}
