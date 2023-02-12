import 'package:flutter/material.dart';
import 'package:wallpaper/demo/page/showsearch.dart';
import 'package:wallpaper/views/widgets/CustomAppBar.dart';
import 'package:wallpaper/views/widgets/SearchBar.dart';

import '../../controller/apiOper.dart';
import '../../model/categoryModel.dart';
import '../../model/photosModel.dart';
import '../../views/screens/fullScreen.dart';
import '../../views/widgets/catBlock.dart';


class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  late List<PhotosModel> trendingWallList;
  late List<CategoryModel> CatModList;
  bool isLoading = true;

  GetCatDetails() async {
    CatModList = await ApiOperations.getCategoriesList();
    print("GETTTING CAT MOD LIST");
    print(CatModList);
    setState(() {
      CatModList = CatModList;
    });
  }

  GetTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpapers();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetCatDetails();
    GetTrendingWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(
          word1: "Co",
          word2: "llection",

        ),
        actions: [
               IconButton(
                icon: Icon(Icons.search,color: Colors.grey,),
                onPressed: () {
                  showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
                  

                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert,color: Colors.grey,),
                onPressed: () {},
              ),
             
            ],
        
      ),
      body:  isLoading ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: Column(
          children: [

            // Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     child: SearchBar()
            // ),


            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: CatModList.length,
                    itemBuilder: ((context, index) => CatBlock(
                          categoryImgSrc: CatModList[index].catImgUrl,
                          categoryName: CatModList[index].catName,
                        ))),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}