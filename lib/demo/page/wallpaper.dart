import 'package:flutter/material.dart';
import 'package:wallpaper/demo/page/showsearch.dart';
import 'package:wallpaper/views/widgets/CustomAppBar.dart';
import 'package:wallpaper/views/widgets/SearchBar.dart';

import '../../controller/apiOper.dart';
import '../../model/categoryModel.dart';
import '../../model/photosModel.dart';
import '../../views/screens/fullScreen.dart';


class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
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
          word1: "Wallpaper",
          word2: "Guru",

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


            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 20),
            //   child: SizedBox(
            //     height: 50,
            //     width: MediaQuery.of(context).size.width,
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: CatModList.length,
            //         itemBuilder: ((context, index) => CatBlock(
            //               categoryImgSrc: CatModList[index].catImgUrl,
            //               categoryName: CatModList[index].catName,
            //             ))),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 800,
              child: RefreshIndicator(
                onRefresh: () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Wallpaper()));// request Wallpaper
                },
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 200,
                        crossAxisCount: 2,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 10),
                    itemCount: trendingWallList.length,
                    itemBuilder: ((context, index) => GridTile(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullScreen(
                                          imgUrl:
                                              trendingWallList[index].imgSrc)));
                            },
                            child: Hero(
                              tag: trendingWallList[index].imgSrc,
                              child: Container(
                                height: 800,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                      height: 800,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      trendingWallList[index].imgSrc),
                                ),
                              ),
                            ),
                          ),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}