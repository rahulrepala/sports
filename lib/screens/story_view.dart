
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:video_player/video_player.dart';


class StoryView extends StatefulWidget {
  const StoryView({Key? key}) : super(key: key);

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView>  with TickerProviderStateMixin {
  late List<VideoPlayerController> _videoController=[
    VideoPlayerController.asset(
      'assets/videos/0.mp4',
    ),
    VideoPlayerController.asset(
      'assets/videos/1.mp4',
    ),
    VideoPlayerController.asset(
      'assets/videos/2.mp4',
    ),
    VideoPlayerController.asset(
      'assets/videos/3.mp4',
    ),
    ];

  late List<AnimationController> controller=[
     AnimationController(
        duration: const Duration(seconds: 3), vsync: this),
     AnimationController(
        duration: const Duration(seconds: 3), vsync: this),
    AnimationController(
        duration: const Duration(seconds: 3), vsync: this),
     AnimationController(
        duration: const Duration(seconds: 3), vsync: this),   
  ];
  late Animation<double> animation;
  

  funcCall(i){
    duration=Duration(seconds: 3);  
    print('calledhereX'+p.toString());

     _videoController[i].initialize(); 
     _videoController[i].play();

     animation = Tween(begin: 0.0, end: 1.0).animate(controller[i])
      ..addListener(() {
        setState(() {
        });
      });
     controller[i].repeat(); 
     if(timer.isExpired){
         timer..reset()..start();
      }else{
        timer.start();
      }
     
  }

  int p=0;
  late PausableTimer timer;
   Duration duration= Duration(seconds: 3);  

  @override
  void initState() {
    timer=PausableTimer(duration, () { 
      print('calledhere'+p.toString());
       p=p+1;
       if(p==4){
         Navigator.pop(context);
       }
       funcCall(p);
    });
    funcCall(p);
    super.initState();
  }


  @override
  void dispose() {
    _videoController.forEach((element) { element.dispose();});
    controller.forEach((element) { element.dispose();});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
             GestureDetector(
               
               onLongPress: () {
                              print('callingXXX');
                                  _videoController[p].pause();
                                  controller[p].stop(canceled: false);
                                  duration=timer.duration;
                                  print('callingXXX'+timer.duration.toString());
                                  timer.pause();
                   },
                  onLongPressEnd: (de) {
                              print('callingXYYY');
                                   _videoController[p].play();
                                   controller[p].forward();
                                   timer..reset()..start();
                   },
                  onVerticalDragDown: (de){
                     controller[p].stop();
                     p=p+1;
                     funcCall(p);
                   },
                  // onHorizontalDragStart: (de){
                  //   print('offset pos1'+de.globalPosition.toString());
                  //   //  controller[p].stop();
                  //   //   p=p-1;
                  //   //   funcCall(p);
                  // },
                   
                  //  onVerticalDragUpdate: (de){
                  //     print('offset pos2'+de.globalPosition.toString());
                  //   //  p=p-1;
                  //   //  funcCall(p);
                  //  },
              //  onTapDown:(de){
              //     print('offset pos3'+de.globalPosition.toString());
              //     controller[p].stop();
              //            p=p-2;
              //         funcCall(p);
              //     },
           //    onTapUp:(de){
                  // print('offset pos4'+de.globalPosition.toString());
                      //    controller[p].stop();
                      //    if(p==0){
                      //      p=0;
                      //    }else if(p==1){
                      //      p=p-1;
                      //    }else{
                      //      p=p-2;
                      //    }
                         
                      // funcCall(p);
              //  },
               child: VideoPlayer(_videoController[p])),
             Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: List.generate(4, (index){
                        return Padding(
                          padding: const EdgeInsets.only(right:3.0),
                          child: Container(
                                  width: size.width/4-6,
                                  child: LinearProgressIndicator(
                                      value: p==index?animation.value:p<index?0:1,
                                 ),
                                ),
                        );
                    }),
                    
                    )
                ),
          ],
        ),
      )
    );
  }
}