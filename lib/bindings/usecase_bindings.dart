import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/domain/usecases/login_usecase.dart';
import 'package:getx_structure/modules/home/domain/usecases/stock_price_usecase.dart';


class UseCaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginUseCase(authRepository: Get.find()),
    );
   
    Get.put(StockPriceUseCase(repository: Get.find()));
  }
}
