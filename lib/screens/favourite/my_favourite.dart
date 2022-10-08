import 'package:flutter/material.dart';
import 'package:providerpractice/provider/favourite_provider.dart';
import 'package:provider/provider.dart';


class MyFavouriteItemsScreen extends StatefulWidget {
  const MyFavouriteItemsScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItemsScreen> createState() => _MyFavouriteItemsScreenState();
}

class _MyFavouriteItemsScreenState extends State<MyFavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    print(favoriteItemProvider.selectedItem);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Favourite'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: favoriteItemProvider.selectedItem.length,
                    itemBuilder: (context , index){
                      return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                        return ListTile(
                          title: Text('item '+favoriteItemProvider.selectedItem[index].toString()),
                          trailing: InkWell(
                            onTap: (){
                              if(value.selectedItem.contains(favoriteItemProvider.selectedItem[index])){
                                value.removeItem(favoriteItemProvider.selectedItem[index]);
                              }
                              else{
                                value.addItems(favoriteItemProvider.selectedItem[index]);
                              }
                            },
                              child: Icon(value.selectedItem.contains(favoriteItemProvider.selectedItem[index]) ? Icons.favorite : Icons.favorite_outline)
                          ),
                        );
                      });
        }
                ),
              )
            ],
          ),
        )
    );
  }
}
