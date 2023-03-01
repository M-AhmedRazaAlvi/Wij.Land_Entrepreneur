import 'package:flutter/foundation.dart';
import 'package:wij_land/anacdots_mobile/models/anecdotes_model/get_anacdots_by_id_reponse.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../api_client/anecdotes_directory_clients.dart';
import '../../models/anecdotes_model/delete_anacdots_by_id_request.dart';

class GetAnacdotsByIdProvider extends ChangeNotifier {
  GetAnacdotsByIDResponse getAnacdotsByIDResponse = GetAnacdotsByIDResponse();
  bool isLoading = false;
  PickResult? selectedPlace;
  Future getAnacdotsByIdData(int anacdotID) async {
    isLoading = true;
    getAnacdotsByIDResponse =
        await AnecdotesDirectoryClients.getAnecdotesByID(anacdotID);
    isLoading = false;

    notifyListeners();
  }

  DeleteAnacdotsByID deletAnacdotsById = DeleteAnacdotsByID();
  Future deleteAnacdotsByID(int id) async {
    isLoading = true;
    deletAnacdotsById = await AnecdotesDirectoryClients.deletAnacdotsByID(id);
    isLoading = false;
    notifyListeners();
  }
  // List saveImage = [];
  //  Future getImages()async{
  //   for(int i=0;i<getAnacdotsByIDResponse.data!.anecdoteFiles!.length;i++){
  //     saveImage.addAll(getAnacdotsByIDResponse.data!.anecdoteFiles![i].)
  //   }
  //  }
}
