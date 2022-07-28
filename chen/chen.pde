import peasy.*;

float x = 0.1;
float y = 0.3;
float z = -0.6;

float a = 25;
float b = 3;
float c = 20;
float u = -15.15;

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
  scale(4);
  stroke(255);

  for (int n = 0; n < 5; n++) {

    background(0);

    float dt = 0.001;
    float dx = (a * (y - x)) * dt;
    float dy = (x - x * z + c * y + u) * dt;
    float dz = (x * y - b * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));


    PVector vprev = new PVector(0, 0, 0);

    //stroke(0, 0, 100);
    //line(0, 0, 0, 20, 0, 0);
    //line(0, 0, 0, 0, 20, 0);
    //line(0, 0, 0, 0, 0, 20);

    float hue = 0;

    for (PVector v : points) {
      stroke(hue, 100, 100);
      hue = hue + 0.03;
      if (hue >= 360) {
        hue = 0;
      }
      line(vprev.x, vprev.y, vprev.z, v.x, v.y, v.z);
      vprev = v;
    }
  }
}
