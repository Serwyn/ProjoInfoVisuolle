
PVector ballVelocityVector() {
  gravityForce.x = sin(rZ) * gr;
  gravityForce.z = -sin(rX) * gr;

  float normalForce = 1;
  float mu = 0.01;
  float frictionMagnitude = normalForce * mu;
  PVector friction = velocity.copy();
  friction.mult(-1);
  friction.normalize();
  friction.mult(frictionMagnitude);
  velocity = velocity.add(friction);
  velocity = velocity.add(gravityForce);
  sphereuh = sphereuh.add(velocity);
  sphereuh.x = max(min(sphereuh.x, boox/2), -boox/2);
  sphereuh.z = max(min(sphereuh.z, boox/2), -boox/2);
  if (abs(sphereuh.x)==boox/2) velocity.x = -velocity.x*0.8;
  if (abs(sphereuh.z)==boox/2) velocity.z = -velocity.z*0.8;
  return velocity;
}