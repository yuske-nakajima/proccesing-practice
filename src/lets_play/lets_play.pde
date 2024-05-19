// 画面の中心に Hello, World! と表示する
int windowWidth = 400;
int windowHeight = 400;

void settings() {
    size(windowWidth, windowHeight);
}

void setup() {
    background(255);
    fill(0);
    textSize(32);
    textAlign(CENTER,TOP);
}

void draw() {
    text("Hello, World!", width / 2, height / 2);
}
