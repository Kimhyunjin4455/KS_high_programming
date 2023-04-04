enum ProductType { HomeAppliances, Clothing, DailyNecessity }
class Product<T> {
  int price;
  int amount;
  String title;
  String description;
  ProductType type;

  T? _moreInfo;

  Product({
    required this.price,
    required this.amount,
    required this.title,
    required this.description,
    required this.type,
  });

  setProductMoreInfo(T moreInfo) {
    _moreInfo = moreInfo;
  } //setter

  T? get moreInfo => _moreInfo;
  //getter
}

class HomeApplicance {
  String? option1;
  String? option2;
  HomeApplicance({this.option1, this.option2});
}

class Clothing {
  String? option3;
  String? option4;
  Clothing({this.option3, this.option4});
}

class DailyNecessity {
  String? option5;
  String? option6;
  DailyNecessity({this.option5, this.option6});
}

void main() {
  // Product 생성 시 Clothing 으로 지정을 해주면 moreInfo 데이터 타입은 자동적으로 Clothing 가 되는 것
  // Dart에서 var 키워드를 사용해서 변수를 선언하면, 해당 변수가 참조하고 있는 객체에 따라서 타입이 결정된다. 아래는 Product 타입
  var homeApplianceProduct = Product<Clothing>(
    price: 1000,
    amount: 100,
    title: 'TV',
    description: 'TV 설명',
    type: ProductType.HomeAppliances,
  );

  homeApplianceProduct
      .setProductMoreInfo(Clothing(option3: '상의', option4: '하의'));

//화면
  print(homeApplianceProduct.moreInfo!.option3);
  print(homeApplianceProduct.type);
  print(homeApplianceProduct.amount);
}
