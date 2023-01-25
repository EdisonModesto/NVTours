import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
    var _municipality = ref.watch(municipalityProvider);
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
                child: _municipality.when(
                  data: (data){
                    return ListView.builder(
                      itemCount: data.municipalities.length,
                      itemBuilder: (builder, index){
                        return ListTile(
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
