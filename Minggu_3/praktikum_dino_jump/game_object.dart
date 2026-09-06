abstract class GameObject {
  double x, y;
  GameObject(this.x, this.y);
  void render();
  void update();
}

abstract class Obstacle extends GameObject {
  Obstacle(super.x, super.y);
  void move();
}
