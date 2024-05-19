PShape japan;
float map_scale = 0.7;
int square_len = 1200;
int[] Prefectures;

void settings() {
  size(square_len,square_len);
  smooth();
}

void setup() {
  japan = loadShape("Blank_map_of_Japan.svg");

  // ランダムに都道府県を選択
  Prefectures = new int[1];
  for (int i=0; i<1; i++) {
    Prefectures[i] = int(random(47));
  }
  noLoop();
}

void draw() {
  // 背景を青色に設定
  background(color(0, 0, 255));

  // SVGファイルに含まれる色を無効化
  japan.disableStyle();

  // 都道府県の形を拡大縮小
  japan.getChild("ground").getChild(0).scale(map_scale);

  // 色を黄色に設定
  fill(color(255, 255, 0));

  // すべての都道府県を黄色で描画
  shape(japan.getChild("ground").getChild(0), square_len * map_scale / 3, square_len * map_scale / 4);

  // 色をマゼンタに設定
  prefecturesColoring(japan,Prefectures, color(255, 0, 255), map_scale);

  // 画像を保存
  saveFrame("map output.png");
}
void prefecturesColoring(PShape nation, int[] prefectures, int pColor, float mapScale) {
  for(int i = 0;
  i < prefectures.length; i++) {
    // 都道府県の形を取得
    PShape prefecture = nation.getChild("ground").getChild(0).getChild(prefectures[i]);

    // SVGファイルに含まれる色を無効化
    prefecture.disableStyle();

    // 都道府県の形を拡大縮小
    prefecture.scale(mapScale);

    // 都道府県を塗りつぶす
    fill(pColor);

    // 輪郭線を描かない
    noStroke();

    // 都道府県を描画
    shape(prefecture, square_len * map_scale / 3, square_len * map_scale / 4);  // Draw a single prefecture
  }
}
