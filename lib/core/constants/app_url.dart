class AppUrl {
  static const baseUrl = 'http://192.168.1.5:5000';
  static const apiV = '/api';

  static const signup = '$apiV/auth/signup';
  static const signin = '$apiV/auth/signin';
  static const getUser = '$apiV/auth/user';

  static const addTask = '$apiV/task/add';
  static const getTasks = '$apiV/task/tasks';

  static const addCategory = '$apiV/category/add';
  static const getCategories = '$apiV/category/categories';
}
