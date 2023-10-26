import 'package:givoo/services/LoginService.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class TokenService {
  findTokenInfo() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
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