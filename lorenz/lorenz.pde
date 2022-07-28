import peasy.*;

float x = random(-0.1, 0.1);
float y = random(-0.1, 0.1);
float z = random(-0.1, 0.1);

float sigma = 10;
float rho = 28;
float beta = 8/3;

PeasyCam cam;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  //size(1800, 1000, P3D);
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 100);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);

  float dt = 0.006;
  float dx = (sigma * (y - x)) * dt;
  float dy = (x * (rho - z) - y) * dt;
  float dz = (x * y - beta * z) * dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new PVector(x, y, z));

  translate(0, 0, -80);
  scale(5);
  stroke(255);

  PVector vprev = new PVector(0, 0, 0);

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
