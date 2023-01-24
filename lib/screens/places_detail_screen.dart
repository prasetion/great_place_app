import 'package:flutter/material.dart';
import 'package:great_place_app/providers/great_places.dart';
import 'package:great_place_app/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/place-detail";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Text(
            selectedPlace.location!.address,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MapScreen(
                  initialLocation: selectedPlace.location!,
                  isSelecting: false,
                ),
              ));
            },
            child: Text("View On Map"),
            // style: Theme.of(context).textTheme.button,
            //  TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
