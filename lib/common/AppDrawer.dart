import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nvtours/features/2.%20Home/HomeView.dart';
import 'package:nvtours/viewmodel/SpotViewModel.dart';

import '../viewmodel/MunicipalityViewModel.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {

  @override
  Widget build(BuildContext context) {
    var municipality = ref.watch(municipalityProvider);
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Municipalities",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: municipality.when(
                  data: (data){
                    return ListView.builder(
                      itemCount: data.municipalities.length,
                      itemBuilder: (builder, index){
                        return ListTile(
                          onTap: (){
                            ref.read(spotProvider.notifier).refreshSpot(data.municipalities.values.elementAt(index).spots, data.municipalities.keys.elementAt(index));
                            values = List.filled(15, false);

                            if(data.municipalities.keys.elementAt(index) == "Kayapa"){
                              values[0] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Ambaguio") {
                              values[1] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Aritao") {
                              values[2] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Santa Fe") {
                              values[3] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Dupax Del Sur") {
                              values[4] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Alfonso Castaneda") {
                              values[5] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Dupax Del Norte") {
                              values[6] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Kasibu") {
                              values[7] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Bambang") {
                              values[8] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Bayombong") {
                              values[9] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Quezon") {
                              values[10] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Diadi") {
                              values[11] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Bagabag") {
                              values[12] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Solano") {
                              values[13] = true;
                            } else if(data.municipalities.keys.elementAt(index) == "Villaverde") {
                              values[14] = true;
                            }


                            Navigator.pop(context);
                            context.go("/");
                     //      GoRouter.of(context).push("/");
                          },
                          title: Text(
                            data.municipalities.keys.elementAt(index),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace){
                    return const Center(
                      child: Text("Error"),
                    );
                  },
                  loading: (){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
