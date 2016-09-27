Particle[] particle;//your code here
void setup()
{
	size(720,720);//your code here
	particle = new Particle[10];
	for(int i = 0; i < particle.length; i++)
	{
		particle[i] = new NormalParticle();
		particle[0] = new OddballParticle();
	}
}
void draw()
{
	background(45);
	for(int i = 0; i < particle.length; i++)
	{
			particle[i].move();
			particle[i].show();//your code here
	}
}
class NormalParticle implements Particle
{
	double myX, myY, mySpeed, myTheta;
	int myColor;
	NormalParticle()
	{
		myX = 360;
		myY = 360;
		myTheta = Math.random()*6.28;
		mySpeed = Math.random()*5;
		myColor = (int)(Math.random()*255);
	}
	public void move()
	{
		myX = myX + Math.cos(myTheta)*mySpeed;
		myY = myY + Math.sin(myTheta)*mySpeed;
	}
	public void show()
	{
		fill(255,0,0);
		ellipse((float)myX, (float)myY, 25, 25);
	}
	//your code here
}
interface Particle
{
	public void move();
	public void show();
}

class OddballParticle implements Particle//uses an interface
{
	double myX, myY, mySpeed, myTheta;
	int myColor;
	boolean reverse;
	OddballParticle()
	{
		myX = 360;
		myY = 360;
		myTheta = Math.random()*6.28;
		mySpeed = Math.random()*24-12;
		myColor = (int)(Math.random()*255);
		reverse = false;
	}
	public void move()
	{
		if(myX > 720)
		{
			myX = myX - 30;
			reverse = true;
		}
		else if(myX <0)
		{
			myX = myX + 30;
			reverse = false;
		}
		else 
		{
			if (reverse == true)
				myX = myX + Math.cos(myTheta)*mySpeed;
			else if (reverse == false)
				myX = myX - Math.cos(myTheta)*mySpeed;
		}

		if(myY > 720)
		{
			myY = myY - 30;
			reverse = true;
		}
		else if(myY <0)
		{
			myY = myY + 30;
			reverse = false;
		}
		else 
		{
			if (reverse == true)
				myY = myY + Math.cos(myTheta)*mySpeed;
			else if (reverse == false)
				myY = myY - Math.cos(myTheta)*mySpeed;
		}
	}
	public void show()
	{
		fill(255);
		ellipse((float)myX,(float)myY,25,25);
	}
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

