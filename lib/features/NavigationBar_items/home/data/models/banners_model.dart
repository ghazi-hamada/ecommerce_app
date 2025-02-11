class BannersModel {
  int? bannersId;
  String? bannersTitle;
  String? bannersTitleAr;
  String? bannersDescription;
  String? bannersDescriptionAr;
  String? bannersImageUrl;
  String? bannersRedirectUrl;
  String? bannersStartDate;
  String? bannersEndDate;
  String? bannersStatus;

  BannersModel(
      {this.bannersId,
      this.bannersTitle,
      this.bannersTitleAr,
      this.bannersDescription,
      this.bannersDescriptionAr,
      this.bannersImageUrl,
      this.bannersRedirectUrl,
      this.bannersStartDate,
      this.bannersEndDate,
      this.bannersStatus});

  BannersModel.fromJson(Map<String, dynamic> json) {
    bannersId = json['banners_id'];
    bannersTitle = json['banners_title'];
    bannersTitleAr = json['banners_title_ar'];
    bannersDescription = json['banners_description'];
    bannersDescriptionAr = json['banners_description_ar'];
    bannersImageUrl = json['banners_image_url'];
    bannersRedirectUrl = json['banners_redirect_url'];
    bannersStartDate = json['banners_start_date'];
    bannersEndDate = json['banners_end_date'];
    bannersStatus = json['banners_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banners_id'] = bannersId;
    data['banners_title'] = bannersTitle;
    data['banners_title_ar'] = bannersTitleAr;
    data['banners_description'] = bannersDescription;
    data['banners_description_ar'] = bannersDescriptionAr;
    data['banners_image_url'] = bannersImageUrl;
    data['banners_redirect_url'] = bannersRedirectUrl;
    data['banners_start_date'] = bannersStartDate;
    data['banners_end_date'] = bannersEndDate;
    data['banners_status'] = bannersStatus;
    return data;
  }
}
