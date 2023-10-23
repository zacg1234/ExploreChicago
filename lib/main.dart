import 'package:flutter/material.dart';
import 'MyListView.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<String> resTitles = const
  ["Goosefoot", "Alinea", "Boka", "Oriole", "The Capital Grille"] ;
  final List<String> resAddresses = const
  ["2656 W Lawrence Ave,\nChicago, IL 60625", "1723 N Halsted St,\nChicago, IL 60614",
    "1729 N Halsted St,\nChicago, IL 60614", "661 W Walnut St,\nChicago, IL 60661",
    "633 N St Clair St,\nChicago, IL 60611"] ;
  final List<Image> resThumbnails =
  [Image.asset('assets/res_Goosefoot.jpeg', fit: BoxFit.cover), Image.asset('assets/res_Alinea.jpeg', fit: BoxFit.cover),
    Image.asset('assets/res_Boka.jpeg', fit: BoxFit.cover), Image.asset('assets/res_Oriole.jpeg', fit: BoxFit.cover),
    Image.asset('assets/res_TheCapitalGrille.jpeg', fit: BoxFit.cover)] ;


  final List<String> atrTitles = const
  ["Navy Pier", "Millennium Park", "Riverwalk", "Art Institute", "The Field Museum"] ;
  final List<String> atrAddresses = const
  ["600 E Grand Ave,\nChicago, IL 60611", "201 E Randolph St,\nChicago, IL 60602",
    "E Wacker Dr,\nChicago, IL 60601", "111 S Michigan Ave,\nChicago, IL 60603",
    "1400 S Lake Shore Dr,\nChicago, IL 60605"] ;
  final List<Image> atrThumbnails =
  [Image.asset('assets/atr_NavyPier.jpeg', fit: BoxFit.cover), Image.asset('assets/atr_MillenniumPark.jpeg', fit: BoxFit.cover),
    Image.asset('assets/atr_Riverwalk.jpeg', fit: BoxFit.cover), Image.asset('assets/atr_ArtInstitute.jpeg', fit: BoxFit.cover),
    Image.asset('assets/atr_FieldMuseum.jpeg', fit: BoxFit.cover)] ;


  final List<String> sportTitles = const
  ["The Chicago Bulls", "The Chicago Bears", "The Chicago White Sox", "The Chicago Cubs", "The Chicago Fire"] ;
  final List<String> sportAddresses = const
  ["1901 W Madison St,\nChicago, IL 60612", "1410 Special Olympics Dr,\nChicago, IL 60605",
    "333 W 35th St,\nChicago, IL 60616", "1060 W Addison St,\nChicago, IL 60613",
    "1410 Special Olympics Dr,\nChicago, IL 60605"] ;
  final List<Image> sportThumbnails =
  [Image.asset('assets/sport_Bulls.jpeg', fit: BoxFit.cover), Image.asset('assets/sport_Bears.jpeg', fit: BoxFit.cover),
    Image.asset('assets/sport_WhiteSox.jpeg', fit: BoxFit.cover), Image.asset('assets/sport_Cubs.jpeg', fit: BoxFit.cover),
    Image.asset('assets/sport_Fire.png', fit: BoxFit.cover)] ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(fontSize: 20), // Set the font size here
        ),
      ),
      home: DefaultTabController(
        initialIndex: 2,
        length: 3,
        child: Builder(builder: (context){
          return Scaffold(
          appBar: AppBar(
            title: const Text('Explore Chicago'),
            flexibleSpace: FlexibleSpaceBar(
              background: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.colorBurn),
                child: Image.asset('assets/AppBarFlexSpaceImage.jpg',
                    fit: BoxFit.cover),
              ),
             ),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.restaurant),
                ),
                Tab(
                  icon: Icon(Icons.sports_football),
                ),
                Tab(
                  icon: Icon(Icons.local_attraction),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MyListView(
                  thumbNails: resThumbnails,
                  titles: resTitles,
                  addresses: resAddresses
              ),
              MyListView(
                  thumbNails: sportThumbnails,
                  titles: sportTitles,
                  addresses: sportAddresses
              ),
              MyListView(
                  thumbNails: atrThumbnails,
                  titles: atrTitles,
                  addresses: atrAddresses
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                int currentTab = DefaultTabController.of(context).index;
                final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context) ;
                scaffold.showSnackBar(
                  SnackBar(
                    content: Text('Current tab number: ${currentTab + 1}'),
                    action: SnackBarAction(
                        label: 'OK',
                        onPressed: scaffold.hideCurrentSnackBar),
                    duration: const Duration(seconds: 7),
                  ),
                );
              },
              child: const Icon(Icons.add)
          ),
        );
        })
      )
    );
  }


}