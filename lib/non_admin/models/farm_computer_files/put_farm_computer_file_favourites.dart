class PutFarmComputerFilesFavourites {
  bool? isFavourite;

  PutFarmComputerFilesFavourites({this.isFavourite});

  PutFarmComputerFilesFavourites.fromJson(Map<String, dynamic> json) {
    isFavourite = json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_favourite'] = this.isFavourite;
    return data;
  }
}
