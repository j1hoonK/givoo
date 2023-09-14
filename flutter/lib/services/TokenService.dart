import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/services/LoginService.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class TokenService {
  findTokenInfo() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      print("Token Information == $tokenInfo");
      print('1');
      FindByToken findByToken = FindByToken();
      var rootToken = findByToken.findUserInfo(tokenInfo.id);
      print('rootToken == $rootToken');
      return true;
    } catch (e) {
      print("Error = $e");
      return false;
    }
  }
}