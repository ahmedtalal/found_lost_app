const String splashScreenImg = "assets/images/splashscreen.jpg";
const String facebookImg = "assets/images/facebook.png";
const String googleImg = "assets/images/google.png";
const String twitterImg = "assets/images/twitter.png";
const String githubImg = "assets/images/github.png";
const String orderFoodImg = "assets/images/orderfood.jpg";
const String cookingFoodImg = "assets/images/cookingfood.jpg";
const String quickDeliveryImg = "assets/images/quickdelivery.jpg";
const String postImg = "assets/images/home.png";
const String searchImg = "assets/images/searching.png";
const String notificationImg = "assets/images/notificaiion.png";
const String marketplaceImg = "assets/images/market.png";
const String settingsImg = "assets/images/setting.png";
const String personImage = "assets/images/person.png";
const String userImage = "assets/images/user.png";

const String darkModeImage = "assets/images/lightmode.png";
const String editUserImage = "assets/images/edit.png";
const String changePasswordImage = "assets/images/changepassword.png";
const String shareAppImage = "assets/images/share.png";
const String ratingAppImage = "assets/images/rate.png";
const String logoutImage = "assets/images/logout.png";
const String ordersImage = "assets/images/cart.png";
const String chatImg = "assets/images/chat.png";
const String addItemImg = "assets/images/additem.png";
const String itemsImg = "assets/images/items.png";
const String foundImg = "assets/images/founditem.png";
const String lostImg = "assets/images/lostitem.png";
const String contactusImg = "assets/images/contactus.png";
const String followusImg = "assets/images/followus.png";
const String privacypolicyImg = "assets/images/privacypolicy.png";
const String yamanicon = "assets/images/yemen.ico";
const String mainLogo = "assets/images/main_logo.png";
const String emptyData = "assets/images/emptysearch.png";
const String emptyItems = "assets/images/emptyData.jpg";
const String appFont = "Sofia Pro";
const String mapKey = "key";
const String mapValue = "value";
const String userKey = "UserKey";
Map<String, dynamic> successRequest({dynamic responseBody}) {
  return {
    mapKey: "success",
    mapValue: responseBody,
  };
}

Map<String, dynamic> failedRequest({dynamic responseBody}) {
  return {
    mapKey: "failed",
    mapValue: responseBody,
  };
}
