class Pokemon{
  String name = '현진';
  
  void intro(){
    print('Hi ${name}!');
  }
}
mixin starting1{
  String name1 = 'boy';
  void water(){
    print('this pokemon is kkobugi');
  }
}
mixin starting2{
  void electric(){
    print('this pokemon is pikachu');
  }
}
mixin starting3{
  void fire(){
    print('this pokemon is pairi');
  }
}
class Choice extends Pokemon with starting1, starting2, starting3{
  String name = '김현진';
  
  @override
  void intro(){
    print('Hi ${super.name}!');
    print('Hi ${this.name}!');
    print('Hi ${name}!!!');
    print('Hi ${this.name1}!');
    print('Hi ${name1}!!!');
    water();
    electric();
    fire();    
  }
}
void main(){
  Choice choice = Choice();
  choice.intro();
  //Choice().intro();
}
