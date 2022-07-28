import peasy.*;

float x = 1;
float y = 1;
float z = 0;

float alpha = 10.82;
float beta = 14.286;
float a = 1.3;
float b = 0.11;
float c = 7;
float d = 0;

PeasyCam cam;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  //size(1800, 1000, P3D);
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 100);
  cam = new PeasyCam(this, 200);
  points.add(new PVector(1, 1, 0));
}

void draw() {
  background(0);

  float dt = 0.05;
  float h = - b * sin((PI * x / (2 * a)) + d);
  float dx = (alpha * (y - h)) * dt;
  float dy = (x - y + z) * dt;
  float dz = (- beta * y) * dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new PVector(x, y, z));

  //translate(0, 0, -80);
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
    hue = hue + 0.2;
    if (hue >= 360) {
      hue = 0;
    }
    line(vprev.x, vprev.y, vprev.z, v.x, v.y, v.z);
    vprev = v;
  }
}
