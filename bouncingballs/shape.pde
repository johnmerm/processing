import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

interface Shape{
  boolean checkCollision(Shape s);
  void afterCollision(Shape s);
  
  void next();
  void draw();
  
  Body getBody();
}
