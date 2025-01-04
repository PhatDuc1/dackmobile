class SharedPrefs {
  storeUser(user)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user);
  }

  getUser(user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }

  removeUser(user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }
}

class SharedPreferences {
  static getInstance() {}
  
  void setString(String s, user) {}
  
  getString(String s) {}
  
  remove(String s) {}
}