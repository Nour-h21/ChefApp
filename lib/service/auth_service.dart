import 'package:dio/dio.dart';
import 'package:project_cook/model/meal_info.dart';
import 'package:project_cook/model/user_model.dart';

String token = "";
Future<bool> signin(UserModel user) async {
  try {
    Dio dio = Dio();
    Response response = await dio.post(
      'https://food-api-omega.vercel.app/api/v1/chef/signin',
      data: user.toMap(),
    );

    if (response.statusCode == 202) {
      token = response.data["token"];

      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

Future<MealModel> getMyInfo() async {
  Dio dio = Dio();
  Response response = await dio.get(
      "https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals",
      options: Options(headers: {"token": "FOODAPI $token"}));

  MealModel users = MealModel.fromMap(
    response.data,
  );

  return users;
}
