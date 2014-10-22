Particle[] manyBobs;
void setup()
{
	background(0);
	size(800,800);
	frameRate(60);
	manyBobs = new Particle[250];
	for (int i = 0; i < manyBobs.length; i++)
 	{
 		manyBobs[0] = new OddballParticle();
 		manyBobs[1] = new JumboParticle();
 		manyBobs[i] = new NormalParticle();
 	}
}
void draw()
{
	fill(0,10);
	rect(0, 0, 800, 805);	
	for (int i = 0; i < manyBobs.length; i++)
	{
		manyBobs[i].move();
		manyBobs[i].wrap();
		manyBobs[i].show();
	}
	
}
class NormalParticle implements Particle
{
	int myColor, redColor, greenColor, blueColor;
	double myX, myY, mySpeed, myAngle;
	NormalParticle()
	{
		myX = 400;
		myY = 400;
		myAngle = (Math.random()*2*Math.PI);
		mySpeed = (Math.random()*10);
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
		ellipse((float)myX, (float)myY, 10, 10);
	}
	public void wrap()
	{
		if(myX >= 800 || myY >= 800 || myX <= 0 || myY <=0)
	    {
	    	myX = 400;
	    	myY = 400;
	    	myAngle = (Math.random()*2*Math.PI);
	    }
	}
}
class JumboParticle extends NormalParticle
{
	int myColor, redColor, greenColor, blueColor;
	double myX, myY, mySpeed, myAngle;
	JumboParticle()
	{
		myX = 400;
		myY = 400;
		myAngle = (Math.random()*2*Math.PI);
		mySpeed = 6;
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
		rect((float)myX, (float)myY, 20, 20);
	}
	public void wrap()
	{
		if(myX >= 800 || myY >= 800 || myX <= 0 || myY <=0)
	    {
	    	myX = 400;
	    	myY = 400;
	    	myAngle = (Math.random()*2*Math.PI);
	    }
	}

}
interface Particle
{
	public void show();
	public void move();
	public void wrap();
}
class OddballParticle implements Particle
{
	int myColor, redColor, greenColor, blueColor, mySize;
	double myX, myY, myAngle, mySpeed;
	OddballParticle()
	{
		myX = 400;
		myY = 400;
		myAngle = (Math.random()*2*Math.PI);
		mySpeed = 22;
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
		if (mySize <= 100)
		{
			mySize ++;
		}
		
	}
	public void show()
	{
		stroke(myColor);
		fill(myColor);
		ellipse((float)myX, (float)myY, mySize, mySize);
	}
	public void wrap()
	{
		if(myX >= 800 || myY >= 800 || myX <= 0 || myY <=0)
	    {
	    	myX = 400;
	    	myY = 400;
	    	myAngle = (Math.random()*2*Math.PI);

	    }
	}
}


