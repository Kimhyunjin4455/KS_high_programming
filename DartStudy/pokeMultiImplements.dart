class Pokemon{
  late String pokeName;
  late String ball;
  void info(){
    // 인터페이스 클래스는 함수 기능 정의 안함
  }
}

class Trainer{
  late String trainerName;
  late int age;
  void trInfo(){
    // 기능 정의 x
  }
}

class GetPokemon{
  late int getpoke;
  void getPoke(){
    // 기능 정의 x
  }
}

class MorePoke{
  late int getpoke;
  void morePoke(){
    //기능정의 x
  }
}

class PokemonInfo implements Pokemon, Trainer, MorePoke{
  // Pokemon 인터페이스를 구현하는 클래스
  String pokeName;
  String ball;
  String trainerName;
  int age;
  int getpoke;
  //int more;
  
  PokemonInfo(
    String pokeName,
    String ball,
    String trainerName,
    int age,
    int getpoke,
    //int more
  ):this.pokeName = pokeName,
    this.ball = ball,
    this.trainerName = trainerName,
    this.age = age,
    this.getpoke = getpoke;
    //this.more = more; // 생성자 
  
  
  void info(){
    print('이 포켓몬의 이름은 ${this.pokeName}이며 ${this.ball}안에 들어있습니다.');
  }
  void trInfo(){
    print('트레이너의 이름은 ${this.trainerName}이며 나이는 ${this.age}입니다.');
  }
  void getPoke(){
    if (this.getpoke >=1 && this.getpoke <=6){
      print('현재 ${this.getpoke}마리를 데리고 있습니다.');
    }
    else{
      print('올바른 숫자를 입력하세요!');
    }
  }
  void morePoke(){
    if (this.getpoke == 6){
      print('더 이상 포켓몬을 잡을 수 없습니다.');
    }
    else if( this.getpoke >=1 && this.getpoke < 6){
      print('포켓몬을 ${6-this.getpoke}마리 더 잡을 수 있습니다.');
    }
    else{
      print('올바른 숫자를 입력하세요!');
    }
  }
}

void main(){
  PokemonInfo pokeInfo = PokemonInfo('뮤', '몬스터볼', '현진', 20, 3);
  // 객체를 통해 생성자에 정보 입력
  pokeInfo.info();
  pokeInfo.trInfo();
  pokeInfo.getPoke();
  pokeInfo.morePoke();
  PokemonInfo('이상해씨', '슈퍼볼', 'nonamed', 22, -1).getPoke();
  PokemonInfo('이상해씨', '슈퍼볼', 'nonamed', 22, 2).morePoke();
  PokemonInfo('이상해씨', '슈퍼볼', 'nonamed', 22, 6).getPoke();
}
