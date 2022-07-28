import peasy.*;

float x = 0;
float y = 10;
float z = 0.1;

float a = 0.1;
float b = 0.1;
float c = 14;

PeasyCam cam;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  //size(1800, 1000, P3D);
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 100);
  cam = new PeasyCam(this, 500);
}

void draw() {

  translate(0, 0, -80);
  scale(5);
  stroke(255);

  background(0);

  for (int n = 0; n < 5; n++) {
    float dt = 0.01;
    float dx = (- y - z) * dt;
    float dy = (x + a * y) * dt;
    float dz = (b + z * (x - c)) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));


    PVector vprev = new PVector(0, 10, 0.1);

    //stroke(0, 0, 100);
    //line(0, 0, 0, 20, 0, 0);
    //line(0, 0, 0, 0, 20, 0);
    //line(0, 0, 0, 0, 0, 20);

    float hue = 0;

    for (PVector v : points) {
      stroke(hue, 100, 100);
      hue = hue + 0.05;
      if (hue >= 360) {
        hue = 0;
      }
      line(vprev.x, vprev.y, vprev.z, v.x, v.y, v.z);
      vprev = v;
    }
  }
}
