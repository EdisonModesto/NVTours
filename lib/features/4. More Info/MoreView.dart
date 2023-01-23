import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/NvAppBar.dart';
import '../../constants/AppColors.dart';
import '../../data/DrawerProvider.dart';

class MoreView extends ConsumerStatefulWidget {
  const MoreView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MoreViewState();
}

class _MoreViewState extends ConsumerState<MoreView> {
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
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            //GoRouter.of(context).push('/tourist-guide/details');
                          },
                          child: Container(
                              width: 1000,
                              decoration: BoxDecoration(
                                color: AppColors().cardColor,
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.image_outlined,
                                  color: AppColors().primary,
                                ),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                  height: 175,
                                  width: 1000,
                                  decoration: BoxDecoration(
                                    color: AppColors().cardColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: AppColors().primary,
                                    ),
                                  )
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Expanded(
                              child: Container(
                                  height: 175,
                                  width: 1000,
                                  decoration: BoxDecoration(
                                    color: AppColors().cardColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: AppColors().primary,
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 225,
                width: 1000,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 1000,
                      decoration: BoxDecoration(
                        color: AppColors().cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tourist Spots",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_circle_outlined, color: AppColors().primary,))
                            ],
                          ),
                          Text(
                            "Expand to see more",
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 1000,
                      decoration: BoxDecoration(
                        color: AppColors().cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Nearby Eateries",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_circle_outlined, color: AppColors().primary,))
                            ],
                          ),
                          Text(
                            "Expand to see more",
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){},
                child: Text(
                  "Locate on Map",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors().primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: Size(1000, 50),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
