import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nvtours/model/MunicipalityModel.dart';

class ResultsSheet extends ConsumerStatefulWidget {
  const ResultsSheet({
    required this.query,
    required this.spot,
    Key? key,
  }) : super(key: key);

  final query;
  final Map<dynamic, Spot> spot;

  @override
  ConsumerState createState() => _ResultsSheetState();
}

class _ResultsSheetState extends ConsumerState<ResultsSheet> {
  
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var filteredSpots = widget.spot.values.where((element){
      return element.name.toLowerCase().contains(widget.query);
    });
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Results",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSpots.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    GoRouter.of(context).push("/guide", extra: filteredSpots.elementAt(index));
                  },
                  title: Text(filteredSpots.elementAt(index).name),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
