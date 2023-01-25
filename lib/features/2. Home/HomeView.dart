import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nvtours/common/NvAppBar.dart';
import 'package:nvtours/constants/AppColors.dart';

import '../../data/DrawerProvider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  @override
  Widget build(BuildContext context) {
    final key = ref.watch(Providers().DrawerProviider);
    var size =  MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: NvAppBar(DrawerKey: key,)
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: Layer1(),
                        child: GestureDetector(
                          onTapDown: (s){
                            Fluttertoast.showToast(msg: "Kayapa");
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer2(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer3(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer4(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer5(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer6(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer7(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer8(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer9(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer10(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer11(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Layer 12");
                        },
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer12(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Layer 13");

                        },
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer13(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("im not tapped");
                        },
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer14(),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: CustomPaint(
                          size: Size(500,(500*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Layer15(),
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Container(
                height: 225,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors().cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tourist Spots",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index){
                          return Container(
                            height: 50,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tourist Spot $index",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    GoRouter.of(context).push("/guide");
                                  },
                                  child: const Text(
                                    "Visit",
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    fixedSize: const Size(85, 30),
                                    backgroundColor: AppColors().primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index){
                          return const SizedBox(height: 5,);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(

      ),
    );
  }
}

class Layer1 extends CustomPainter{
  Path path0 = Path();


  @override
  bool? hitTest(Offset position) {
    return path0.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    path0.moveTo(size.width*0.3020000,size.height*0.1800000);
    path0.lineTo(size.width*0.3660000,size.height*0.1700000);
    path0.lineTo(size.width*0.3960000,size.height*0.3000000);
    path0.lineTo(size.width*0.3580000,size.height*0.3560000);
    path0.lineTo(size.width*0.3840000,size.height*0.3960000);
    path0.lineTo(size.width*0.2860000,size.height*0.5020000);
    path0.lineTo(size.width*0.1760000,size.height*0.4760000);
    path0.lineTo(size.width*0.2040000,size.height*0.4220000);
    path0.lineTo(size.width*0.2400000,size.height*0.4140000);
    path0.lineTo(size.width*0.2860000,size.height*0.3360000);
    path0.lineTo(size.width*0.2760000,size.height*0.2580000);
    path0.lineTo(size.width*0.3020000,size.height*0.1800000);
    path0.close();

    canvas.drawPath(path0, paint0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer2 extends CustomPainter{
  Path path1 = Path();

  @override
  bool? hitTest(Offset position) {
    return path1.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path1.moveTo(size.width*0.3700000,size.height*0.1700000);
    path1.lineTo(size.width*0.4700000,size.height*0.1480000);
    path1.lineTo(size.width*0.4860000,size.height*0.2140000);
    path1.lineTo(size.width*0.4460000,size.height*0.2620000);
    path1.lineTo(size.width*0.4440000,size.height*0.3020000);
    path1.lineTo(size.width*0.3960000,size.height*0.3000000);
    path1.lineTo(size.width*0.3700000,size.height*0.1700000);
    path1.close();

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer3 extends CustomPainter{

  Path path2 = Path();

  @override
  bool? hitTest(Offset position) {
    return path2.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint2 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path2.moveTo(size.width*0.3860000,size.height*0.3940000);
    path2.lineTo(size.width*0.4680000,size.height*0.4860000);
    path2.lineTo(size.width*0.4800000,size.height*0.6280000);
    path2.lineTo(size.width*0.4320000,size.height*0.6120000);
    path2.lineTo(size.width*0.4220000,size.height*0.5580000);
    path2.lineTo(size.width*0.2840000,size.height*0.5020000);
    path2.lineTo(size.width*0.3860000,size.height*0.3940000);
    path2.close();

    canvas.drawPath(path2, paint2);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer4 extends CustomPainter{

  Path path3 = Path();

  @override
  bool? hitTest(Offset position) {
    return path3.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint3 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path3.moveTo(size.width*0.1760000,size.height*0.4780000);
    path3.lineTo(size.width*0.1660000,size.height*0.4900000);
    path3.lineTo(size.width*0.1780000,size.height*0.5280000);
    path3.lineTo(size.width*0.2400000,size.height*0.5600000);
    path3.lineTo(size.width*0.2720000,size.height*0.6220000);
    path3.lineTo(size.width*0.4400000,size.height*0.6160000);
    path3.lineTo(size.width*0.4220000,size.height*0.5560000);
    path3.lineTo(size.width*0.2880000,size.height*0.5000000);
    path3.lineTo(size.width*0.1760000,size.height*0.4780000);
    path3.close();

    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer5 extends CustomPainter{

  Path path4 = Path();

  @override
  bool? hitTest(Offset position) {
    return path4.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint4 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path4.moveTo(size.width*0.4120000,size.height*0.4200000);
    path4.lineTo(size.width*0.4660000,size.height*0.4840000);
    path4.lineTo(size.width*0.4800000,size.height*0.6280000);
    path4.lineTo(size.width*0.5320000,size.height*0.6500000);
    path4.lineTo(size.width*0.5440000,size.height*0.8200000);
    path4.lineTo(size.width*0.5600000,size.height*0.8460000);
    path4.lineTo(size.width*0.6300000,size.height*0.7120000);
    path4.lineTo(size.width*0.5160000,size.height*0.4640000);
    path4.lineTo(size.width*0.4600000,size.height*0.4140000);
    path4.lineTo(size.width*0.4120000,size.height*0.4200000);
    path4.close();

    canvas.drawPath(path4, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer6 extends CustomPainter{

  Path path5 = Path();
  @override
  bool? hitTest(Offset position) {
    return path5.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint5 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path5.moveTo(size.width*0.5620000,size.height*0.8520000);
    path5.lineTo(size.width*0.6340000,size.height*0.7160000);
    path5.lineTo(size.width*0.6860000,size.height*0.7000000);
    path5.lineTo(size.width*0.8260000,size.height*0.8100000);
    path5.lineTo(size.width*0.6000000,size.height*0.9500000);
    path5.lineTo(size.width*0.5620000,size.height*0.8520000);
    path5.close();

    canvas.drawPath(path5, paint5);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer7 extends CustomPainter{

  Path path6 = Path();
  @override
  bool? hitTest(Offset position) {
    return path6.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint6 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path6.moveTo(size.width*0.4600000,size.height*0.4160000);
    path6.lineTo(size.width*0.5600000,size.height*0.4100000);
    path6.lineTo(size.width*0.5640000,size.height*0.4440000);
    path6.lineTo(size.width*0.6600000,size.height*0.5300000);
    path6.lineTo(size.width*0.6820000,size.height*0.7000000);
    path6.lineTo(size.width*0.6340000,size.height*0.7140000);
    path6.lineTo(size.width*0.5140000,size.height*0.4680000);
    path6.lineTo(size.width*0.4600000,size.height*0.4160000);
    path6.close();

    canvas.drawPath(path6, paint6);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer8 extends CustomPainter{

  Path path7 = Path();
  @override
  bool? hitTest(Offset position) {
    return path7.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint7 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path7.moveTo(size.width*0.6600000,size.height*0.5300000);
    path7.lineTo(size.width*0.7180000,size.height*0.5440000);
    path7.lineTo(size.width*0.7760000,size.height*0.5200000);
    path7.lineTo(size.width*0.8240000,size.height*0.4220000);
    path7.lineTo(size.width*0.8080000,size.height*0.3580000);
    path7.lineTo(size.width*0.7680000,size.height*0.3200000);
    path7.lineTo(size.width*0.7140000,size.height*0.3060000);
    path7.lineTo(size.width*0.6000000,size.height*0.3320000);
    path7.lineTo(size.width*0.5600000,size.height*0.3860000);
    path7.lineTo(size.width*0.5620000,size.height*0.4440000);
    path7.lineTo(size.width*0.6600000,size.height*0.5300000);
    path7.close();

    canvas.drawPath(path7, paint7);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer9 extends CustomPainter{

  Path path8 = Path();
  @override
  bool? hitTest(Offset position) {
    return path8.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint8 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path8.moveTo(size.width*0.3560000,size.height*0.3600000);
    path8.lineTo(size.width*0.3980000,size.height*0.2980000);
    path8.lineTo(size.width*0.6000000,size.height*0.3300000);
    path8.lineTo(size.width*0.5600000,size.height*0.3820000);
    path8.lineTo(size.width*0.5600000,size.height*0.4080000);
    path8.lineTo(size.width*0.4100000,size.height*0.4200000);
    path8.lineTo(size.width*0.3560000,size.height*0.3600000);
    path8.close();

    canvas.drawPath(path8, paint8);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer10 extends CustomPainter{
  Path path9 = Path();
  @override
  bool? hitTest(Offset position) {
    return path9.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint9 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path9.moveTo(size.width*0.4460000,size.height*0.3040000);
    path9.lineTo(size.width*0.4420000,size.height*0.2600000);
    path9.lineTo(size.width*0.4860000,size.height*0.2140000);
    path9.lineTo(size.width*0.5920000,size.height*0.3100000);
    path9.lineTo(size.width*0.5960000,size.height*0.3280000);
    path9.lineTo(size.width*0.4460000,size.height*0.3040000);
    path9.close();

    canvas.drawPath(path9, paint9);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer11 extends CustomPainter{

  Path path10 = Path();
  @override
  bool? hitTest(Offset position) {
    return path10.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint10 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path10.moveTo(size.width*0.5520000,size.height*0.2740000);
    path10.lineTo(size.width*0.6040000,size.height*0.2340000);
    path10.lineTo(size.width*0.6800000,size.height*0.2560000);
    path10.lineTo(size.width*0.7240000,size.height*0.2420000);
    path10.lineTo(size.width*0.7160000,size.height*0.3000000);
    path10.lineTo(size.width*0.6000000,size.height*0.3300000);
    path10.lineTo(size.width*0.5920000,size.height*0.3120000);
    path10.lineTo(size.width*0.5520000,size.height*0.2740000);
    path10.close();

    canvas.drawPath(path10, paint10);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer12 extends CustomPainter{

  Path path11 = Path();
  @override
  bool? hitTest(Offset position) {
    return path11.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint11 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path11.moveTo(size.width*0.7240000,size.height*0.2400000);
    path11.lineTo(size.width*0.7420000,size.height*0.1400000);
    path11.lineTo(size.width*0.7420000,size.height*0.0980000);
    path11.lineTo(size.width*0.6840000,size.height*0.0380000);
    path11.lineTo(size.width*0.6240000,size.height*0.1120000);
    path11.lineTo(size.width*0.6600000,size.height*0.1380000);
    path11.lineTo(size.width*0.6800000,size.height*0.2480000);
    path11.lineTo(size.width*0.7240000,size.height*0.2400000);
    path11.close();

    canvas.drawPath(path11, paint11);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer13 extends CustomPainter{
  Path path12 = Path();

  @override
  bool? hitTest(Offset position) {
    return path12.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint12 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path12.moveTo(size.width*0.6800000,size.height*0.2560000);
    path12.lineTo(size.width*0.6020000,size.height*0.2340000);
    path12.lineTo(size.width*0.5740000,size.height*0.1700000);
    path12.lineTo(size.width*0.5720000,size.height*0.1260000);
    path12.lineTo(size.width*0.6320000,size.height*0.1160000);
    path12.lineTo(size.width*0.6600000,size.height*0.1380000);
    path12.lineTo(size.width*0.6800000,size.height*0.2560000);
    path12.close();
    canvas.drawPath(path12, paint12);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer14 extends CustomPainter{

  Path path13 = Path();
  @override
  bool? hitTest(Offset position) {
    return path13.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint13 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    path13.moveTo(size.width*0.5560000,size.height*0.2700000);
    path13.lineTo(size.width*0.6060000,size.height*0.2320000);
    path13.lineTo(size.width*0.5780000,size.height*0.1740000);
    path13.lineTo(size.width*0.4800000,size.height*0.1880000);
    path13.lineTo(size.width*0.4880000,size.height*0.2180000);
    path13.lineTo(size.width*0.5560000,size.height*0.2700000);
    path13.close();

    canvas.drawPath(path13, paint13);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Layer15 extends CustomPainter{

  Path path14 = Path();
  @override
  bool? hitTest(Offset position) {
    return path14.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint14 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    path14.moveTo(size.width*0.5760000,size.height*0.1720000);
    path14.lineTo(size.width*0.5660000,size.height*0.1280000);
    path14.lineTo(size.width*0.4700000,size.height*0.1480000);
    path14.lineTo(size.width*0.4800000,size.height*0.1840000);
    path14.lineTo(size.width*0.5760000,size.height*0.1720000);
    path14.close();

    canvas.drawPath(path14, paint14);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



