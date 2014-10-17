import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Starfield extends PApplet {

Particle[] manyBobs;
public void setup()
{
	size(800,800);
	// frameRate(10);
	manyBobs = new Particle[200];
	for (int i = 0; i < manyBobs.length; i++)
 	{
 		manyBobs[0] = new OddballParticle();
 		manyBobs[1] = new JumboParticle();
 		manyBobs[i] = new NormalParticle();
 	}
}
public void draw()
{
	background(0);
	for (int i = 0; i < manyBobs.length; i++)
	{
		manyBobs[i].move();
		manyBobs[i].show();
	}
	
}
class NormalParticle implements Particle
{
	int myColor, redColor, greenColor, blueColor, myAngle;
	double myX, myY, mySpeed;
	NormalParticle()
	{
		myX = 400;
		myY = 400;
		myAngle = (int)(Math.random()*361);
		mySpeed = (int)(Math.random()*3);
		redColor = (int)(Math.random()*256);
		greenColor = (int)(Math.random()*256);
		blueColor = (int)(Math.random()*256);
		myColor = color(redColor, greenColor, blueColor);

	}
	public void move()
	{
		myX = (Math.cos(myAngle)* mySpeed) + myX;
		myY = Math.sin(myAngle) + myY;
	}
	public void show()
	{
		stroke(myColor);
		fill(myColor);
		ellipse((float)myX, (float)myY, 4, 4);
	}
}
class JumboParticle implements Particle
{
	int myColor, redColor, greenColor, blueColor, myAngle;
	double myX, myY, mySpeed;
	JumboParticle()
	{
		myX = 400;
		myY = 400;
		myAngle = (int)(Math.random()*361);
		mySpeed = (int)(Math.random()*3);
		redColor = (int)(Math.random()*256);
		greenColor = (int)(Math.random()*256);
		blueColor = (int)(Math.random()*256);
		myColor = color(redColor, greenColor, blueColor);

	}
	public void move()
	{
		myX = (Math.cos(myAngle)* mySpeed) + myX;
		myY = Math.sin(myAngle) + myY;
	}
	public void show()
	{
		stroke(myColor);
		fill(myColor);
		ellipse((float)myX, (float)myY, 20, 20);
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	int myColor, redColor, greenColor, blueColor, mySize;
	double myX, myY, myAngle, mySpeed;
	OddballParticle()
	{
		myX = 400;
		myY = 400;
		myAngle = (double)(Math.random()*361);
		mySpeed = (int)(Math.random()*1);
		redColor = 100;
		greenColor = 22;
		blueColor =22;
		myColor = color(redColor, greenColor, blueColor);
		mySize = 1;

	}
	public void move()
	{
		myX = (Math.cos(myAngle)* mySpeed) + myX;
		myY = Math.sin(myAngle) + myY;
		mySize ++;
		
	}
	public void show()
	{
		stroke(myColor);
		fill(myColor);
		ellipse((float)myX, (float)myY, mySize, mySize);
	}
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Starfield" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
