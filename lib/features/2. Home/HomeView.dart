import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              const Expanded(
                child: Center(child: Text("Map goes here")),
              ),
              Container(
                height: 225,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors().cardColor,
                  borderRadius: BorderRadius.circular(20),
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
                              borderRadius: BorderRadius.circular(12),
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
                                    context.go("/guide");
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
