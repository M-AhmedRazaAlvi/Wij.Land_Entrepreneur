import 'package:flutter/cupertino.dart';
import 'package:wij_land/anacdots_mobile/api_client/anecdotes_directory_clients.dart';
import 'package:wij_land/anacdots_mobile/models/search_model/anecdots_search_response.dart';

class AnecdotSearchProvider extends ChangeNotifier {
  AnecdotsSearchResponse? searchResponse;
  TextEditingController searchController = TextEditingController();

  Future searchAnecdot({required String key}) async {
    searchResponse =
        await AnecdotesDirectoryClients.getAnecdotSearch(searchKey: key);
    notifyListeners();
  }
}
