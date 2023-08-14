import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../../util/Buttons/elevatedButton.dart';
import '../../../util/Painter/painter.dart';
import '../../../util/TextFeild/textFeild.dart';

class AddNewProject extends HookWidget {
  final Color color;
  const AddNewProject({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    final addNewProjcetConroller = useTextEditingController();
    final _closeButtonAnimationcontroller = useAnimationController(
      duration: const Duration(seconds: 3),
    );
    Animation<double> _closeButtonAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _closeButtonAnimationcontroller,
            curve: Curves.easeInOutExpo));

    _closeButtonAnimationcontroller.forward();

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.34,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            size: Size(double.infinity,
                (MediaQuery.of(context).size.height).toDouble()),
            painter: RPSCustomPainter(
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  textField(
                    context: context,
                    controller: addNewProjcetConroller,
                    hintText: 'Enter Your Project Name..',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: customElevatedButton(
                      context: context,
                      onTap: () {},
                      title: 'Add',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09335,
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
              animation: _closeButtonAnimationcontroller,
              builder: (context, _) {
                return Opacity(
                  opacity: _closeButtonAnimation.value,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Ionicons.close),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
