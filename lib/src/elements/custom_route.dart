import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';

class CustomRoute<T> extends PageRouteBuilder<T> {
  int from = 0;
  CustomRoute({
    this.from,
    Function(BuildContext, Animation<double>, Animation<double>) builder,
    RouteSettings settings,
  }) : super(pageBuilder: builder, settings: settings);

  @override
  Duration transitionDuration = Duration(milliseconds: 1050);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if (settings.) {
    //   return child;
    // }
    return
        // FadeTransition(       //for fade transition uncomment this
        //   opacity: animation,
        //   child: child,
        // );
        SlideTransition(
      //for slide transition uncomment this (sliding)
      position: Tween<Offset>(
        begin: from == 0
            ? Offset(0, 2)
            : (from == 1 ? Offset(1, 0) : Offset(-1, 0)),

        // const Offset(0, 2),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.slowMiddle,
        ),
        // animation
      ),

      child: child,
    );
    // ScaleTransition(      //for scale transition uncomment this (Zoom in and Zoom out)
    //   scale: Tween<double>(
    //               begin: 0.0,
    //               end: 1.0,
    //             ).animate(
    //               CurvedAnimation(
    //                 parent: animation,
    //                 curve: Curves.fastOutSlowIn,
    //               ),
    //             ),
    //             child: child,
    //           );
  }
}

class AnimateBuild extends StatefulWidget {
  Widget child;
  int from;
  AnimateBuild({Key key, this.from, this.child}) : super(key: key);

  @override
  _AnimateBuildState createState() => _AnimateBuildState();
}

class _AnimateBuildState extends State<AnimateBuild>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 950), vsync: this);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    /*animation.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  });*/
//this will start the animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          // AnimatedBuilder(
          //   animation: animation,
          //   child: widget.child,
          //   builder: (BuildContext context, Widget child) {
          //     return
          SlideTransition(
        //for slide transition uncomment this (sliding)
        position: Tween<Offset>(
          begin: widget.from == 0
              ? Offset(0, 2)
              : (widget.from == 1 ? Offset(1, 0) : Offset(-1, 0)),

          // const Offset(0, 2),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.slowMiddle,
          ),
          // animation
        ),

        child: widget.child,
        // );
        // },
      ),
    );
  }
}

class AnimateBuildScale extends StatefulWidget {
  Widget child;
  int from;
  AnimateBuildScale({Key key, this.from, this.child}) : super(key: key);

  @override
  _AnimateBuildScaleState createState() => _AnimateBuildScaleState();
}

class _AnimateBuildScaleState extends State<AnimateBuildScale>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 950), vsync: this);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    /*animation.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  });*/
//this will start the animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          // AnimatedBuilder(
          //   animation: animation,
          //   child: widget.child,
          //   builder: (BuildContext context, Widget child) {
          //     return
          ScaleTransition(
        //for slide transition uncomment this (sliding)
        scale:
            //  Tween<Offset>(
            //   begin: widget.from == 0
            //       ? Offset(0, 2)
            //       : (widget.from == 1 ? Offset(1, 0) : Offset(-1, 0)),

            //   // const Offset(0, 2),
            //   end: Offset.zero,
            // ).animate(
            CurvedAnimation(
          parent: animation,
          curve: Curves.slowMiddle,
        ),
        // animation
        // ),

        child: widget.child,
        // );
        // },
      ),
    );
  }
}
// class CustomPageTransitionBuilder extends PageTransitionsBuilder {
//  @override
//   Widget buildTransitions<T>(
//     PageRoute<T> route,
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     if (route.settings.isInitialRoute) {
//       return child;
//     }
//     return FadeTransition(
//       opacity: animation,
//       child: child,
//     );
//   }
// }
