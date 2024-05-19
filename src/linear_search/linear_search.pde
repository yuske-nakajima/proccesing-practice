// 線形探索   Linear Search
// 番兵無し   No Sentinel

final int NUMBER_OF_RANDOM_DATA = 500;
final String DATA_FILE_NAME = "RandomData.txt";
final int DIAMITER = 10;
final int SEARCHING_VALUE = 6;

ArrayList<Integer> nums = new ArrayList<Integer>();
int i = 0; // サーチ回数。drawする度にカウントアップ

void settings() {
  size(NUMBER_OF_RANDOM_DATA,NUMBER_OF_RANDOM_DATA);
}

void setup() {
  //ランダムなデータの読み込み
  loadData();
  //ディスプレイウインドウの設定
  //size(NUMBER_OF_RANDOM_DATA,NUMBER_OF_RANDOM_DATA);
  background(0,0,0);
  frameRate(60);
  stroke(255,0,0);
}

void loadData() {
  String lines[] = loadStrings(DATA_FILE_NAME);
  for(String val : lines) {
    nums.add(int(val));
  }
}

void linearSearch() {
  if (SEARCHING_VALUE == nums.get(i)) {
    println("Hit!");
    ellipse(i * 30 + 10,nums.get(i) / 500 + 10,DIAMITER*2,DIAMITER*2);
    pause();
  }
}

void draw() {
  println("Searching value is " + SEARCHING_VALUE);
  if (i < NUMBER_OF_RANDOM_DATA) {
    //サーチ１パス
    linearSearch();
    //結果をプロット
    println("Count " + i);
    clear();
    for(int k=0;
    k < nums.size();
    k++) {
      if (k == i) {
        ellipse(k * 30 + 10,nums.get(k) / 500 + 10,DIAMITER*2,DIAMITER*2);
      } else {
        ellipse(k * 30 + 10,nums.get(k) / 500 + 10,DIAMITER,DIAMITER);
      }
    }
    ++i;
  }
}
