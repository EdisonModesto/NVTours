import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/NvAppBar.dart';
import '../../constants/AppColors.dart';
import '../../data/DrawerProvider.dart';

class GuideView extends ConsumerStatefulWidget {
  const GuideView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _GuideViewState();
}

class _GuideViewState extends ConsumerState<GuideView> {
  TextEditingController _searchCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final key = ref.watch(Providers().DrawerProviider);
  //  var size =  MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Container(
                  decoration: BoxDecoration(
                      color: AppColors().cardColor,
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                  ),
                  width: 1000,
                  height: 40,
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                      hintText: "Search Account",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  )
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        GoRouter.of(context).push('/Info');
                      },
                      child: Container(
                        height: 175,
                        width: 1000,
                        decoration: BoxDecoration(
                          color: AppColors().cardColor,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: Colors.black),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(11)),
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: AppColors().primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 1000,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: AppColors().primary,
                                    border: const Border(
                                      top: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tourist Spot Description",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    );
                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(height: 10);
                  },
                )
              ),
              const SizedBox(height: 10),
              Container(
                height: 175,
                width: 1000,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tourist Guides",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Person $index",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Contact No.",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index){
                          return const SizedBox(height: 10,);
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
