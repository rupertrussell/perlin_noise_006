// https://www.openprocessing.org/sketch/815389
// Fork of Rivers 2 by Naoki Tsutae https://www.openprocessing.org/user/154720
// perlin_noise_005 by Rupert Russell 30 September 2020
// artwork on redbubble at: https://www.redbubble.com/people/rupertrussell/works/58753682-perlin-noise-005?asc=u


int Unit;
float Counter;
float MX, MY;
int saveCount = 0;

void setup() {
  size(10000, 10000);
  Unit=128 * 1; // largest size of a square
  Counter=0;
  stroke(0);
  fill(255);
  strokeWeight(2);
}

void draw() {
  background(0);
  Counter+=0.0004;
  for (int j=0; j<height; j+=Unit) {
    for (int i=0; i<width; i+=Unit) {
      DrawRect(i, j, Unit);
    }
  }
}

void DrawRect(int x, int y, int size) {
  float cx=x+size/2; // center in the square for noise
  float cy=y+size/2;
  float n=noise(cx/width, cy/height, mag(cx, cy)/height-Counter);
  float threshold=map(size, Unit, 25, 0.2, 0.06 );

 // threshold= threshold + 0.001;
  // println(" threshold= "+ threshold);

  if (abs(n-0.5)>threshold) {
    rect(x, y, size, size );
  } else {
    size=size/2;
    if (size>=2) { // smallest size of a square = 4pixels
      DrawRect(x, y, size);
      DrawRect(x+size, y, size);
      DrawRect(x, y+size, size);
      DrawRect(x+size, y+size, size);
    }
  }
}

void mouseClicked() {
  saveCount ++;
  save(saveCount +  ".png");
  println(" Saved " + saveCount +  ".png");
}
