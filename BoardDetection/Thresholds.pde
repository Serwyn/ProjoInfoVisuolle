PImage brightInterval(PImage img, int b1, int b2) {
  PImage result = createImage(img.width, img.height, RGB);
  img.loadPixels();
  result.loadPixels();
  for (int i = 0; i < img.width * img.height; i++) {
    if (brightness(img.pixels[i]) < b1 || brightness(img.pixels[i]) > b2) result.pixels[i] = color(0);
    else result.pixels[i] = img.pixels[i];
  }
  return result;
}

PImage hueInterval(PImage img, int h1, int h2) {
  PImage result = createImage(img.width, img.height, RGB);
  for (int i = 0; i < img.width * img.height; i++) {
    if (hue(img.pixels[i]) < h1 || hue(img.pixels[i]) > h2) result.pixels[i] = color(0);
    else result.pixels[i] = img.pixels[i];
  }
  return result;
}

PImage satInterval(PImage img, int s1, int s2) {
  PImage result = createImage(img.width, img.height, RGB);
  for (int i = 0; i < img.width * img.height; i++) {
    if (saturation(img.pixels[i]) < s1 || saturation(img.pixels[i]) > s2) result.pixels[i] = color(0);
    else result.pixels[i] = img.pixels[i];
  }
  return result;
}

PImage binaryThreshold(PImage img, int t) {
  PImage result = createImage(img.width, img.height, RGB);
  for (int i = 0; i < img.width * img.height; i++) {
    if (brightness(img.pixels[i]) < t) result.pixels[i] = color(0);
    else result.pixels[i] = color(255);
  }
  return result;
}