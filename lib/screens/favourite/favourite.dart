import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/provider/favourite_provider.dart';
import 'package:providerpractice/screens/favourite/my_favourite.dart';


class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {


  @override
  Widget build(BuildContext context) {
    // final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Favourite'),
            actions: [
              InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteItemsScreen())); },
                  child: Icon(Icons.favorite)),
              SizedBox(width: 20,)
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: 100,
                    itemBuilder: (context , index){
                      return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                        return ListTile(
                          onTap: (){
                            if(value.selectedItem.contains(index)){
                              value.removeItem(index);
                            }
                            else{
                              value.addItems(index);
                            }
                          },
                          title: Text('Item '+index.toString(),),
                          trailing: Icon(value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_outline,),
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
