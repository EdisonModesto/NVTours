import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nvtours/common/AppDrawer.dart';
import 'package:nvtours/common/NvAppBar.dart';
import 'package:nvtours/constants/AppColors.dart';
import 'package:nvtours/viewmodel/MunicipalityViewModel.dart';
import 'package:nvtours/viewmodel/SpotViewModel.dart';

import '../../common/resultsSheet.dart';
import '../../data/DrawerProvider.dart';
import '../../model/MunicipalityModel.dart';

var values = List.filled(15, false);

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  TextEditingController _searchCtrl = TextEditingController();

  //var currently = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final key = ref.watch(Providers().DrawerProviider);
    final spotList = ref.watch(
        spotProvider); // DO NOT DELETE, this rebuilds Ui when change detected
    var muniProvider = ref.watch(municipalityProvider);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: key,

        body: muniProvider.when(
          data: (data) {
            Map<String, Spot> spot = {};
            for (var i = 0; i < data.municipalities.length; i++) {
              spot.addAll(data.municipalities.values.elementAt(i).spots);
            }
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/municipalities/${ref.read(spotProvider.notifier).state["municipality"].toString().toLowerCase()}.jpg",
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
              child: Column(
                children: [
                  PreferredSize(
                      preferredSize: const Size.fromHeight(70),
                      child: NvAppBar(
                        DrawerKey: key,
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 30),
                      child: muniProvider.when(
                        data: (data) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                  decoration: BoxDecoration(
                                      color: AppColors().cardColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  width: 1000,
                                  height: 40,
                                  child: TextField(
                                    controller: _searchCtrl,
                                    onSubmitted: (data) {
                                      showMaterialModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (context) {
                                            return ResultsSheet(
                                              query: data,
                                              spot: spot,
                                            );
                                          });
                                    },
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      hintText: "Search",
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search),
                                    ),
                                  )),
                              Center(
                                  child: SizedBox(
                                height: 300,
                                width: 300,
                                child: Stack(
                                  children: [
                                    CustomPaint(
                                      size: Size(500, (500 * 1).toDouble()),
                                      //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                      painter: Layer1(),
                                      child: GestureDetector(
                                        onTapDown: (s) {
                                          for (int i = 0; i < values.length; i++) {
                                            values[i] = false;
                                          }
                                          values[0] = true;

                                          setState(() {
                                            ref
                                                .read(spotProvider.notifier)
                                                .refreshSpot(
                                                    data.municipalities["Kayapa"]!
                                                        .spots,
                                                    "Kayapa");
                                          });
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[1] = true;
                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Ambaguio"]!.spots,
                                              "Ambaguio");
                                        });
                                        Fluttertoast.showToast(msg: "Ambaguio");
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer2(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[2] = true;
                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Aritao"]!.spots,
                                              "Aritao");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer3(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[3] = true;
                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Santa Fe"]!.spots,
                                              "Santa Fe");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer4(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[4] = true;
                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Dupax Del Sur"]!
                                                  .spots,
                                              "Dupax Del Sur");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer5(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[5] = true;
                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data
                                                  .municipalities[
                                                      "Alfonso Castaneda"]!
                                                  .spots,
                                              "Alfonso Castaneda");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer6(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[6] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Dupax Del Norte"]!
                                                  .spots,
                                              "Dupax Del Norte");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer7(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[7] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Kasibu"]!.spots,
                                              "Kasibu");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer8(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[8] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Bambang"]!.spots,
                                              "Bambang");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer9(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[9] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Bayombong"]!.spots,
                                              "Bayombong");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer10(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[10] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Quezon"]!.spots,
                                              "Quezon");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer11(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[11] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Diadi"]!.spots,
                                              "Diadi");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer12(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[12] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Bagabag"]!.spots,
                                              "Bagabag");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer13(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[13] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Solano"]!.spots,
                                              "Solano");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer14(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        for (int i = 0; i < values.length; i++) {
                                          values[i] = false;
                                        }
                                        values[14] = true;

                                        setState(() {
                                          ref.read(spotProvider.notifier).refreshSpot(
                                              data.municipalities["Villaverde"]!
                                                  .spots,
                                              "Villaverde");
                                        });
                                      },
                                      child: CustomPaint(
                                        size: Size(500, (500 * 1).toDouble()),
                                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                        painter: Layer15(),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              Expanded(
                                child: Container(
                                  width: 1000,
                                  decoration: BoxDecoration(
                                    color: AppColors().cardColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, top: 20, bottom: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ref.read(spotProvider.notifier)
                                                      .state["municipality"] ==
                                                  null
                                              ? "Select a Municipality"
                                              : "Municipality of ${ref.read(spotProvider.notifier).state["municipality"]}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          ref
                                                      .read(spotProvider.notifier)
                                                      .state?["municipality"] ==
                                                  null
                                              ? "Select a Municipality to see its description"
                                              : data
                                                  .municipalities[
                                                      "${ref.read(spotProvider.notifier).state["municipality"]}"]!
                                                  .description,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Tourist Spots",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                            children: List.generate(
                                                ref.read(spotProvider.notifier).state["spots"] ==
                                                        null
                                                    ? 0
                                                    : ref
                                                        .read(spotProvider.notifier)
                                                        .state["spots"]
                                                        .length, (index) {
                                          return Container(
                                            height: 50,
                                            width: 1000,
                                            margin: EdgeInsets.only(bottom: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                bottom: 8,
                                                right: 15,
                                                left: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: AutoSizeText(
                                                    "${ref.read(spotProvider.notifier).state["spots"].keys.elementAt(index)}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    GoRouter.of(context).push(
                                                        "/guide",
                                                        extra: ref
                                                            .read(
                                                                spotProvider.notifier)
                                                            .state["spots"]
                                                            .values
                                                            .elementAt(index));
                                                  },
                                                  child: const Text(
                                                    "Visit",
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    fixedSize: const Size(85, 30),
                                                    backgroundColor:
                                                        AppColors().primary,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(20),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        error: (error, stackTrace) => const Center(
                          child: Text("Error"),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error"),
          ),
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        drawer: const AppDrawer());
  }
}

class Layer1 extends CustomPainter {
  Path path0 = Path();

  @override
  bool? hitTest(Offset position) {
    return path0.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Kayapa',
          style: TextStyle(
            color: values[0] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint0 = Paint()
      ..color = values[0] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path0.moveTo(size.width * 0.3020000, size.height * 0.1800000);
    path0.lineTo(size.width * 0.3660000, size.height * 0.1700000);
    path0.lineTo(size.width * 0.3960000, size.height * 0.3000000);
    path0.lineTo(size.width * 0.3580000, size.height * 0.3560000);
    path0.lineTo(size.width * 0.3840000, size.height * 0.3960000);
    path0.lineTo(size.width * 0.2860000, size.height * 0.5020000);
    path0.lineTo(size.width * 0.1760000, size.height * 0.4760000);
    path0.lineTo(size.width * 0.2040000, size.height * 0.4220000);
    path0.lineTo(size.width * 0.2400000, size.height * 0.4140000);
    path0.lineTo(size.width * 0.2860000, size.height * 0.3360000);
    path0.lineTo(size.width * 0.2760000, size.height * 0.2580000);
    path0.lineTo(size.width * 0.3020000, size.height * 0.1800000);
    path0.close();

    canvas.drawPath(path0, paint0);
    canvas.drawPath(path0, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(95 - (textPainter.width / 2), 115 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer2 extends CustomPainter {
  Path path1 = Path();

  @override
  bool? hitTest(Offset position) {
    return path1.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Amba-\nguio',
          style: TextStyle(
            color: values[1] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint1 = Paint()
      ..color = values[1] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path1.moveTo(size.width * 0.3700000, size.height * 0.1700000);
    path1.lineTo(size.width * 0.4700000, size.height * 0.1480000);
    path1.lineTo(size.width * 0.4860000, size.height * 0.2140000);
    path1.lineTo(size.width * 0.4460000, size.height * 0.2620000);
    path1.lineTo(size.width * 0.4440000, size.height * 0.3020000);
    path1.lineTo(size.width * 0.3960000, size.height * 0.3000000);
    path1.lineTo(size.width * 0.3700000, size.height * 0.1700000);
    path1.close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path1, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(127 - (textPainter.width / 2), 70 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer3 extends CustomPainter {
  Path path2 = Path();

  @override
  bool? hitTest(Offset position) {
    return path2.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Aritao',
          style: TextStyle(
            color: values[2] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint2 = Paint()
      ..color = values[2] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    path2.moveTo(size.width * 0.3860000, size.height * 0.3940000);
    path2.lineTo(size.width * 0.4680000, size.height * 0.4860000);
    path2.lineTo(size.width * 0.4800000, size.height * 0.6280000);
    path2.lineTo(size.width * 0.4320000, size.height * 0.6120000);
    path2.lineTo(size.width * 0.4220000, size.height * 0.5580000);
    path2.lineTo(size.width * 0.2840000, size.height * 0.5020000);
    path2.lineTo(size.width * 0.3860000, size.height * 0.3940000);
    path2.close();

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path2, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(115 - (textPainter.width / 2), 145 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer4 extends CustomPainter {
  Path path3 = Path();

  @override
  bool? hitTest(Offset position) {
    return path3.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Santa Fe',
          style: TextStyle(
            color: values[3] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint3 = Paint()
      ..color = values[3] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    path3.moveTo(size.width * 0.1760000, size.height * 0.4780000);
    path3.lineTo(size.width * 0.1660000, size.height * 0.4900000);
    path3.lineTo(size.width * 0.1780000, size.height * 0.5280000);
    path3.lineTo(size.width * 0.2400000, size.height * 0.5600000);
    path3.lineTo(size.width * 0.2720000, size.height * 0.6220000);
    path3.lineTo(size.width * 0.4400000, size.height * 0.6160000);
    path3.lineTo(size.width * 0.4220000, size.height * 0.5560000);
    path3.lineTo(size.width * 0.2880000, size.height * 0.5000000);
    path3.lineTo(size.width * 0.1760000, size.height * 0.4780000);
    path3.close();

    canvas.drawPath(path3, paint3);
    canvas.drawPath(path3, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(95 - (textPainter.width / 2), 165 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer5 extends CustomPainter {
  Path path4 = Path();

  @override
  bool? hitTest(Offset position) {
    return path4.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Dupax\nDel Sur',
          style: TextStyle(
            color: values[4] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    Paint paint4 = Paint()
      ..color = values[4] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path4.moveTo(size.width * 0.4120000, size.height * 0.4200000);
    path4.lineTo(size.width * 0.4660000, size.height * 0.4840000);
    path4.lineTo(size.width * 0.4800000, size.height * 0.6280000);
    path4.lineTo(size.width * 0.5320000, size.height * 0.6500000);
    path4.lineTo(size.width * 0.5440000, size.height * 0.8200000);
    path4.lineTo(size.width * 0.5600000, size.height * 0.8460000);
    path4.lineTo(size.width * 0.6300000, size.height * 0.7120000);
    path4.lineTo(size.width * 0.5160000, size.height * 0.4640000);
    path4.lineTo(size.width * 0.4600000, size.height * 0.4140000);
    path4.lineTo(size.width * 0.4120000, size.height * 0.4200000);
    path4.close();

    canvas.drawPath(path4, paint4);
    canvas.drawPath(path4, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(157 - (textPainter.width / 2), 175 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer6 extends CustomPainter {
  Path path5 = Path();

  @override
  bool? hitTest(Offset position) {
    return path5.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Alfonso\nCastaneda',
          style: TextStyle(
            color: values[5] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint5 = Paint()
      ..color = values[5] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path5.moveTo(size.width * 0.5620000, size.height * 0.8520000);
    path5.lineTo(size.width * 0.6340000, size.height * 0.7160000);
    path5.lineTo(size.width * 0.6860000, size.height * 0.7000000);
    path5.lineTo(size.width * 0.8260000, size.height * 0.8100000);
    path5.lineTo(size.width * 0.6000000, size.height * 0.9500000);
    path5.lineTo(size.width * 0.5620000, size.height * 0.8520000);
    path5.close();

    canvas.drawPath(path5, paint5);
    canvas.drawPath(path5, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(200 - (textPainter.width / 2), 245 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer7 extends CustomPainter {
  Path path6 = Path();

  @override
  bool? hitTest(Offset position) {
    return path6.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Dupax\nDel Norte',
          style: TextStyle(
            color: values[6] ? Colors.white : Colors.black,
            fontSize: 6,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint6 = Paint()
      ..color = values[6] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path6.moveTo(size.width * 0.4600000, size.height * 0.4160000);
    path6.lineTo(size.width * 0.5600000, size.height * 0.4100000);
    path6.lineTo(size.width * 0.5640000, size.height * 0.4440000);
    path6.lineTo(size.width * 0.6600000, size.height * 0.5300000);
    path6.lineTo(size.width * 0.6820000, size.height * 0.7000000);
    path6.lineTo(size.width * 0.6340000, size.height * 0.7140000);
    path6.lineTo(size.width * 0.5140000, size.height * 0.4680000);
    path6.lineTo(size.width * 0.4600000, size.height * 0.4160000);
    path6.close();

    canvas.drawPath(path6, paint6);
    canvas.drawPath(path6, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(182 - (textPainter.width / 2), 160 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer8 extends CustomPainter {
  Path path7 = Path();

  @override
  bool? hitTest(Offset position) {
    return path7.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Kasibu',
          style: TextStyle(
            color: values[7] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint7 = Paint()
      ..color = values[7] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path7.moveTo(size.width * 0.6600000, size.height * 0.5300000);
    path7.lineTo(size.width * 0.7180000, size.height * 0.5440000);
    path7.lineTo(size.width * 0.7760000, size.height * 0.5200000);
    path7.lineTo(size.width * 0.8240000, size.height * 0.4220000);
    path7.lineTo(size.width * 0.8080000, size.height * 0.3580000);
    path7.lineTo(size.width * 0.7680000, size.height * 0.3200000);
    path7.lineTo(size.width * 0.7140000, size.height * 0.3060000);
    path7.lineTo(size.width * 0.6000000, size.height * 0.3320000);
    path7.lineTo(size.width * 0.5600000, size.height * 0.3860000);
    path7.lineTo(size.width * 0.5620000, size.height * 0.4440000);
    path7.lineTo(size.width * 0.6600000, size.height * 0.5300000);
    path7.close();

    canvas.drawPath(path7, paint7);
    canvas.drawPath(path7, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(208 - (textPainter.width / 2), 125 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer9 extends CustomPainter {
  Path path8 = Path();

  @override
  bool? hitTest(Offset position) {
    return path8.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Bambang',
          style: TextStyle(
            color: values[8] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint8 = Paint()
      ..color = values[8] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path8.moveTo(size.width * 0.3560000, size.height * 0.3600000);
    path8.lineTo(size.width * 0.3980000, size.height * 0.2980000);
    path8.lineTo(size.width * 0.6000000, size.height * 0.3300000);
    path8.lineTo(size.width * 0.5600000, size.height * 0.3820000);
    path8.lineTo(size.width * 0.5600000, size.height * 0.4080000);
    path8.lineTo(size.width * 0.4100000, size.height * 0.4200000);
    path8.lineTo(size.width * 0.3560000, size.height * 0.3600000);
    path8.close();

    canvas.drawPath(path8, paint8);
    canvas.drawPath(path8, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(145 - (textPainter.width / 2), 110 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer10 extends CustomPainter {
  Path path9 = Path();

  @override
  bool? hitTest(Offset position) {
    return path9.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Bayombong',
          style: TextStyle(
            color: values[9] ? Colors.white : Colors.black,
            fontSize: 5,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint9 = Paint()
      ..color = values[9] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path9.moveTo(size.width * 0.4460000, size.height * 0.3040000);
    path9.lineTo(size.width * 0.4420000, size.height * 0.2600000);
    path9.lineTo(size.width * 0.4860000, size.height * 0.2140000);
    path9.lineTo(size.width * 0.5920000, size.height * 0.3100000);
    path9.lineTo(size.width * 0.5960000, size.height * 0.3280000);
    path9.lineTo(size.width * 0.4460000, size.height * 0.3040000);
    path9.close();

    canvas.drawPath(path9, paint9);
    canvas.drawPath(path9, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(150 - (textPainter.width / 2), 85 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer11 extends CustomPainter {
  Path path10 = Path();

  @override
  bool? hitTest(Offset position) {
    return path10.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Quezon',
          style: TextStyle(
            color: values[10] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint10 = Paint()
      ..color = values[10] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path10.moveTo(size.width * 0.5520000, size.height * 0.2740000);
    path10.lineTo(size.width * 0.6040000, size.height * 0.2340000);
    path10.lineTo(size.width * 0.6800000, size.height * 0.2560000);
    path10.lineTo(size.width * 0.7240000, size.height * 0.2420000);
    path10.lineTo(size.width * 0.7160000, size.height * 0.3000000);
    path10.lineTo(size.width * 0.6000000, size.height * 0.3300000);
    path10.lineTo(size.width * 0.5920000, size.height * 0.3120000);
    path10.lineTo(size.width * 0.5520000, size.height * 0.2740000);
    path10.close();

    canvas.drawPath(path10, paint10);
    canvas.drawPath(path10, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(193 - (textPainter.width / 2), 85 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer12 extends CustomPainter {
  Path path11 = Path();

  @override
  bool? hitTest(Offset position) {
    return path11.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Diadi',
          style: TextStyle(
            color: values[11] ? Colors.white : Colors.black,
            fontSize: 7,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    Paint paint11 = Paint()
      ..color = values[11] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path11.moveTo(size.width * 0.7240000, size.height * 0.2400000);
    path11.lineTo(size.width * 0.7420000, size.height * 0.1400000);
    path11.lineTo(size.width * 0.7420000, size.height * 0.0980000);
    path11.lineTo(size.width * 0.6840000, size.height * 0.0380000);
    path11.lineTo(size.width * 0.6240000, size.height * 0.1120000);
    path11.lineTo(size.width * 0.6600000, size.height * 0.1380000);
    path11.lineTo(size.width * 0.6800000, size.height * 0.2480000);
    path11.lineTo(size.width * 0.7240000, size.height * 0.2400000);
    path11.close();

    canvas.drawPath(path11, paint11);
    canvas.drawPath(path11, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(208 - (textPainter.width / 2), 43 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer13 extends CustomPainter {
  Path path12 = Path();

  @override
  bool? hitTest(Offset position) {
    return path12.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Bagabag',
          style: TextStyle(
            color: values[12] ? Colors.white : Colors.black,
            fontSize: 5,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint12 = Paint()
      ..color = values[12] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path12.moveTo(size.width * 0.6800000, size.height * 0.2560000);
    path12.lineTo(size.width * 0.6020000, size.height * 0.2340000);
    path12.lineTo(size.width * 0.5740000, size.height * 0.1700000);
    path12.lineTo(size.width * 0.5720000, size.height * 0.1260000);
    path12.lineTo(size.width * 0.6320000, size.height * 0.1160000);
    path12.lineTo(size.width * 0.6600000, size.height * 0.1380000);
    path12.lineTo(size.width * 0.6800000, size.height * 0.2560000);
    path12.close();
    canvas.drawPath(path12, paint12);
    canvas.drawPath(path12, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(187 - (textPainter.width / 2), 55 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer14 extends CustomPainter {
  Path path13 = Path();

  @override
  bool? hitTest(Offset position) {
    return path13.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Solano',
          style: TextStyle(
            color: values[13] ? Colors.white : Colors.black,
            fontSize: 6,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint13 = Paint()
      ..color = values[13] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path13.moveTo(size.width * 0.5560000, size.height * 0.2700000);
    path13.lineTo(size.width * 0.6060000, size.height * 0.2320000);
    path13.lineTo(size.width * 0.5780000, size.height * 0.1740000);
    path13.lineTo(size.width * 0.4800000, size.height * 0.1880000);
    path13.lineTo(size.width * 0.4880000, size.height * 0.2180000);
    path13.lineTo(size.width * 0.5560000, size.height * 0.2700000);
    path13.close();

    canvas.drawPath(path13, paint13);
    canvas.drawPath(path13, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(165 - (textPainter.width / 2), 70 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layer15 extends CustomPainter {
  Path path14 = Path();

  @override
  bool? hitTest(Offset position) {
    return path14.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: 'Villaverde',
          style: TextStyle(
            color: values[14] ? Colors.white : Colors.black,
            fontSize: 5,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    Paint paint14 = Paint()
      ..color = values[14] ? Colors.redAccent : Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint strokePath = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path14.moveTo(size.width * 0.5760000, size.height * 0.1720000);
    path14.lineTo(size.width * 0.5660000, size.height * 0.1280000);
    path14.lineTo(size.width * 0.4700000, size.height * 0.1480000);
    path14.lineTo(size.width * 0.4800000, size.height * 0.1840000);
    path14.lineTo(size.width * 0.5760000, size.height * 0.1720000);
    path14.close();

    canvas.drawPath(path14, paint14);
    canvas.drawPath(path14, strokePath);

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset =
        Offset(158 - (textPainter.width / 2), 48 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
