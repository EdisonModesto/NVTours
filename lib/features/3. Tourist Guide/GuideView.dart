import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nvtours/common/resultsSheet.dart';

import '../../common/AppDrawer.dart';
import '../../common/NvAppBar.dart';
import '../../constants/AppColors.dart';
import '../../data/DrawerProvider.dart';
import '../../model/MunicipalityModel.dart';
import '../../viewmodel/MunicipalityViewModel.dart';

class GuideView extends ConsumerStatefulWidget {
  const GuideView({
    required this.spot,
    Key? key,
  }) : super(key: key);

  final Spot spot;

  @override
  ConsumerState createState() => _GuideViewState();
}

class _GuideViewState extends ConsumerState<GuideView> {
  TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    print(widget.spot.pictures);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var muniProvider = ref.watch(municipalityProvider);
    final key = ref.watch(Providers().DrawerProviider);
    //  var size =  MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: key,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: NvAppBar(
              DrawerKey: key,
            )),
        body: muniProvider.when(data: (data) {
          Map<String, Spot> spot = {};
          for (var i = 0; i < data.municipalities.length; i++) {
            print(data.municipalities.values.elementAt(i).spots.keys);
            spot.addAll(data.municipalities.values.elementAt(i).spots);
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors().cardColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
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
                        contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                        hintText: "Search",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .push('/Info', extra: widget.spot);
                          },
                          child: Container(
                              height: 200,
                              width: 1000,
                              decoration: BoxDecoration(
                                color: AppColors().cardColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(color: Colors.black),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(11)),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Image.network(
                                          widget.spot.pictures[0],
                                          fit: BoxFit.cover,
                                          width: 1000,
                                          height: 1000,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 1000,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: AppColors().primary,
                                          border: const Border(
                                            top: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Tap to view more",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 1000,
                          decoration: BoxDecoration(
                            color: AppColors().primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ExpansionTile(
                              title: Text(
                                "Description",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              initiallyExpanded: true,
                              trailing: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              collapsedTextColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              textColor: Colors.white,
                              childrenPadding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.spot.description,
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 1000,
                          decoration: BoxDecoration(
                            color: AppColors().primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ExpansionTile(
                              title: Text(
                                "Tourist Guides",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              initiallyExpanded: true,
                              trailing: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              collapsedTextColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              textColor: Colors.white,
                              childrenPadding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              children: List.generate(widget.spot.guides.length, (index){
                                return Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    widget.spot.guides[index],
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                );
                              })
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 1000,
                          decoration: BoxDecoration(
                            color: AppColors().primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ExpansionTile(
                              title: Text(
                                "Tourist Agencies",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              initiallyExpanded: true,
                              trailing: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              collapsedTextColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              textColor: Colors.white,
                              childrenPadding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              children: List.generate(widget.spot.agencies.length, (index){
                                return Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    widget.spot.agencies[index],
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                );
                              })
                          ),
                        ),

                      ]),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 150,
                    width: 1000,
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emergency Hotlines",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.separated(
                            itemCount: widget.spot.hotlines.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.spot.hotlines[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }, error: (error, stack) {
          return Center(
            child: Text(error.toString()),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
        drawer: const AppDrawer());
  }
}
