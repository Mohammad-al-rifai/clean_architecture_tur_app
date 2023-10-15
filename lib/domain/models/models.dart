// onBoarding models
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

// login models

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}

// Home Data Models:

class BannerAd {
  int id;
  String link;
  String title;
  String image;

  BannerAd(this.id, this.link, this.title, this.image);
}

class Service {
  int? id;
  String? title;
  String? image;

  Service(this.id, this.title, this.image);
}

class Store {
  int? id;
  String? title;
  String? image;

  Store(this.id, this.title, this.image);
}

class HomeData {
  List<BannerAd> banners;
  List<Service> services;
  List<Store> stores;

  HomeData(this.banners, this.services, this.stores);
}

class HomeObject {
  HomeData data;

  HomeObject(this.data);
}

// Store Details Data Model

class StoreDetails {
  int id;
  String title;
  String image;
  String details;
  String services;
  String about;

  StoreDetails(
    this.id,
    this.title,
    this.image,
    this.details,
    this.services,
    this.about,
  );
}
