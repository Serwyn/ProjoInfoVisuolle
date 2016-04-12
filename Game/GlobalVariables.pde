// GAME PARAMETERS
int gameSize = 800;
float sensibilite = 400;

// PHYSICS
PVector gravityForce = new PVector(0, 0, 0);
PVector velocity = new PVector(0, 0, 0);
float gr = 0.2;

// GEO OBJECTS
PVector sphereuh = new PVector(0, 0, 0);
PShape cylinder = new PShape();
ArrayList<PVector> cylindres = new ArrayList();

// COORDINATES
float rX, rZ = 0;
float centreX = 0;
float centreY = 0;
float alpha1 = 0;
float beta1 = 0;
float alpha = 0;
float beta = 0;

// EVENTS VARIABLES
boolean click = false;
boolean pause = false;

// GEO OBJECTS PARAMETERS
float boox = 200;
float radius = 15;
float cylinderBaseSize = 20;
float cylinderHeight = 40;
int cylinderResolution = 40;
float ratio;

//UI
PGraphics mySurface;
PGraphics myScore;
PFont calibri;

//SCORE
float score;
float prev;