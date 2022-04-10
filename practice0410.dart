enum ProductType {
  HomeAppliances,
  Clothing,
  DailyNecessity
}
// 1. 상수 타입 선언
class Product {
  int price;
  int amount;
  String title;
  String description;
  ProductType type;

  HomeApplicance? homeApplicance;
  Clothing? clothing;
  DailyNecessity? dailyNecessity;
  // 2. 변수 선언

  Product({
    required this.price,
    required this.amount,
    required this.title,
    required this.description,
    required this.type,
  });

  // 변수 앞에 _(언더바)가 붙는 경우에는 외부 함수에서 접근이 불가능해진다. 이 변수를 프라이빗(provite) 변수라고도 한다.
  // 프라이빗(private) 변수에 접근하려면 게터(getter)와 세터(setter)메서드가 필요
  // 다트의 특성상 프라이빗 변수를 같은 파일 내에서 사용 가능
  setProductMoreInfoWithHomeAppliances(HomeApplicance _homeAppliances) {
    homeApplicance = _homeAppliances;
  }

  setProductMoreInfoWithClothing(Clothing _clothing) {
    clothing = _clothing;
  }

  setProductMoreInfoWithDailyNecessity(DailyNecessity _dailyNecessity) {
    dailyNecessity = _dailyNecessity;
  }

  dynamic get moreInfo {
    switch (type) {
      case ProductType.HomeAppliances:
        return homeApplicance;
      case ProductType.Clothing:
        return clothing;
      case ProductType.DailyNecessity:
        return dailyNecessity;
    }
  }
  // setter, getter 로 값 받기
}
void main() {
  var homeApplianceProduct = Product(
    price: 1000,
    amount: 100,
    title: 'TV',
    description: 'TV 설명',
    type: ProductType.Clothing,
  );

  homeApplianceProduct.setProductMoreInfoWithClothing(
      Clothing(option3: '노', option4: '웨이'));

//화면
  print((homeApplianceProduct.moreInfo as Clothing).option3);
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

