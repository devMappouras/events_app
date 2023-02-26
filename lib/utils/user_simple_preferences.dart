import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences =
      SharedPreferences.getInstance() as SharedPreferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  //token
  static Future setToken(String token) async =>
      await _preferences.setString('token', token);

  static String getToken() => _preferences.getString('token') ?? '';

  //customerId
  static Future setCustomerId(int customerId) async =>
      await _preferences.setInt('customerId', customerId);

  static int getCustomerId() => _preferences.getInt('customerId') ?? 0;

  //firstName
  static Future setFirstName(String firstName) async =>
      await _preferences.setString('firstName', firstName);

  static String getFirstName() => _preferences.getString('firstName') ?? '';

  //email
  static Future setEmail(String email) async =>
      await _preferences.setString('email', email);

  static String getEmail() => _preferences.getString('email') ?? '';

  //countryId
  static Future setCountryId(int countryId) async =>
      await _preferences.setInt('countryId', countryId);

  static int getCountryId() => _preferences.getInt('countryId') ?? 0;

  static Future setFavoriteList(List<int> list) async {
    // convert your custom list to string list
    List<String> favList = list.map((i) => i.toString()).toList();

    // store your string list in shared prefs
    await _preferences.setStringList("favList", favList);
  }

  static List<int> getFavoriteList() {
    // fetch your string list
    List<String> mList = (_preferences.getStringList('favList') ?? <String>[]);

    if (mList.isEmpty) return <int>[];

    //convert your string list to your original int list
    List<int> mFavList = mList.map((i) => int.parse(i)).toList();

    return mFavList;
  }
}
