Particle[] particle;//your code here
double shiftX, shiftY;
void setup()
{
	size(720,720);//your code here
	particle = new Particle[100];
	for(int i = 0; i < particle.length; i++)
	{
		int myRandom = (int)Math.random()*30;
		particle[i] = new NormalParticle();
		particle[0] = new OddballParticle();
		particle[1] = new JumboParticle();
	}
}
void draw()
{
	shiftX = (360 - mouseX)/60;
	shiftY = (360 - mouseY)/60;
	background(50);
	for(int i = 0; i < particle.length; i++)
	{
			particle[i].move();
			particle[i].show();//your code here
	}
	fill(205);
	rect(150,200,15,320);
	rect(570,200,15,320);
}
class NormalParticle implements Particle
{
	double myX, myY, mySpeed, myTheta, mySize;
	int myColorR, myColorG, myColorB;
	NormalParticle()
	{
		mySize = Math.random()*15;
		myX = 360;
		myY = 360;
		myTheta = Math.random()*6.28;
		mySpeed = Math.random()*24-12;
			if (mySpeed < 4 && mySpeed> 0)
				mySpeed = mySpeed + 8;
			else if (mySpeed < 0 && mySpeed > -4)
				mySpeed = mySpeed - 8;
		myColorR = (int)(Math.random()*255);
		myColorG = (int)(Math.random()*255);
		myColorB = (int)(Math.random()*255);
	}
	public void move()
	{
		myX = myX + Math.cos(myTheta)*mySpeed + shiftX;
		myY = myY + Math.sin(myTheta)*mySpeed + shiftY;
		mySize = mySize + .05;
		if (myX >= 720 || myX <= 0)
		{
			myX = 360;
			myY = 360;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*24-12;
			mySize = Math.random()*15;
		}
		else if (myY >= 720 || myY <= 0)
		{
			myX = 360;
			myY = 360;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*24-12;
			mySize = 0;
		}
	}
	public void show()
	{
		fill(myColorR,myColorG,myColorB);
		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
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
	int myColorR, myColorG, myColorB;
	OddballParticle()
	{
		myX = 360;
		myY = 360;
		mySpeed = Math.random()*15;
		myTheta = (Math.random()-Math.random())*6.28;
		myColorR = (int)(Math.random()*255);
		myColorG = (int)(Math.random()*255);
		myColorB = (int)(Math.random()*255);
	}
	public void move()
	{
		if (myTheta > 0)
			myTheta = myTheta + .15;
		else if (myTheta <=0)
			myTheta = myTheta - .15;
		mySpeed = mySpeed + .5;
		myX = myX + Math.cos(myTheta)*mySpeed;
		myY = myY + Math.sin(myTheta)*mySpeed;
		if (myX < 0 || myX >720)
		{
			myX = 360;
			myY = 360;
			mySpeed = Math.random()*100;
			myTheta = (Math.random()-Math.random())*6.28;
			myColorR = (int)(Math.random()*255);
			myColorG = (int)(Math.random()*255);
			myColorB = (int)(Math.random()*255);
		}
		else if(myY < 0 || myY > 720)
		{
			myX = 360;
			myY = 360;
			mySpeed = Math.random()*100;
			myTheta = (Math.random()-Math.random())*6.28;
			myColorR = (int)(Math.random()*255);
			myColorG = (int)(Math.random()*255);
			myColorB = (int)(Math.random()*255);
		}
	}
	public void show()
	{
		fill(myColorR,myColorG,myColorB);
		ellipse((float)myX,(float)myY,25,25);
	}
	//your code here
}
class JumboParticle extends NormalParticle//uses inheritance
{
	void show()
	{
		ellipse((float)myX, (float)myY, 50,50);
	}//your code here
}

