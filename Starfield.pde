Particle[] particle;//your code here
double shiftX, shiftY, shiftSideX, shiftSideY;
int numParticlesX = 0;
int numParticlesY = 0;
void setup()
{
	size(720,720);//your code here
	particle = new Particle[300];
	for(int i = 220; i < 300; i++)
	{
		int myRandom = (int)Math.random()*30;
		particle[i] = new NormalParticle();
		particle[220] = new OddballParticle();
		particle[221] = new OddballParticle();
		particle[222] = new OddballParticle();
		particle[223] = new OddballParticle();
		particle[224] = new JumboParticle();
	}
	for(int j = 0; j < 110 - numParticlesX; j++)
	{
		particle[j] = new SideParticleX();
	}
	for(int k = 110; k < 220 - numParticlesY; k++)
	{
		particle[k] = new SideParticleY();
	}
}
void draw()
{
	numParticlesY = (int)Math.abs(mouseY-360)/36;
	numParticlesX = (int)Math.abs(mouseX-360)/36;
	shiftX = (360 - mouseX)/45;
	shiftY = (360 - mouseY)/45;
	shiftSideX = (360 - mouseX)/120;
	shiftSideY = (360 - mouseY)/120;
	background(50);
	for(int i = 0; i < particle.length; i++)
	{
			particle[i].move();
			particle[i].show();//your code here
	}
	fill(205);
	rect(150,200,15,320);
	rect(570,200,15,320);
	//quad(0,0,)
	text("x="+(int)mouseX,15,15);
	text("y="+(int)mouseY,15,25);
}
class NormalParticle implements Particle
{
	double myX, myY, mySpeed, myTheta, mySize;
	int myColorR, myColorG, myColorB;
	NormalParticle()
	{
		mySize = Math.random()*15;
		myX = 360+(360-mouseX)/10+Math.random()*25-50;
		myY = 360+(360-mouseY)/10+Math.random()*25-50;
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
		myX = myX + Math.cos(myTheta)*mySpeed + shiftX/(Math.random()+1.1);
		myY = myY + Math.sin(myTheta)*mySpeed + shiftY/(Math.random()+1.1);
		mySize = mySize + .05;
		if (myX >= 720 || myX <= 0)
		{
			myX = 360+(360-mouseX)/10+Math.random()*25-50;
			myY = 360+(360-mouseY)/10+Math.random()*25-50;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*24-12;
			mySize = Math.random()*15;
		}
		else if (myY >= 720 || myY <= 0)
		{
			myX = 360+(360-mouseX)/10+Math.random()*25-50;
			myY = 360+(360-mouseY)/10+Math.random()*25-50;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*24-12;
			mySize = Math.random()*15;
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
		myX = 360+(360-mouseX)/10+Math.random()*25-50;
		myY = 360+(360-mouseY)/10+Math.random()*25-50;
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
			myX = 360+(360-mouseX)/10+Math.random()*25-50;
			myY = 360+(360-mouseY)/10+Math.random()*25-50;
			mySpeed = Math.random()*100;
			myTheta = (Math.random()-Math.random())*6.28;
			myColorR = (int)(Math.random()*255);
			myColorG = (int)(Math.random()*255);
			myColorB = (int)(Math.random()*255);
		}
		else if(myY < 0 || myY > 720)
		{
			myX = 360+(360-mouseX)/10+Math.random()*25-50;
			myY = 360+(360-mouseY)/10+Math.random()*25-50;
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
		ellipse((float)myX, (float)myY, 75,75);
	}//your code here
}
//=================================================================
class SideParticleX implements Particle
{
	double myX, myY, mySpeed, myTheta, mySize, myOpacity;
	int myColorR, myColorG, myColorB;
	SideParticleX()
	{
		myOpacity = Math.random()*80;
		mySize = Math.random()*5;
		myY= Math.random()*720;
		if(mouseX >= 360)
			myX = 720;
		else if(mouseX < 360)
			myX = 0;
		myTheta = Math.random()*6.28;
		mySpeed = Math.random()*10-5;
		myColorR = (int)(Math.random()*255);
		myColorG = (int)(Math.random()*255);
		myColorB = (int)(Math.random()*255);
	}
	public void move()
	{
		myX = myX + Math.cos(myTheta)*mySpeed + shiftSideX/(Math.random()*2+1.8);
		myY = myY + Math.sin(myTheta)*mySpeed + shiftSideY/(Math.random()*2+1.8);
		mySize = mySize + .002;
		myOpacity = myOpacity + .02;
		if (myX >= 720 || myX <= 0)
		{
			myY= Math.random()*720;
			if(mouseX >= 360)
				myX = 720;
			else if(mouseX < 360)
			myX = 0;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*2-1;
			mySize = Math.random()*5;
		}
		else if (myY >= 720 || myY <= 0)
		{
			myY= Math.random()*720;
			if(mouseX >= 360)
				myX = 720;
			else if(mouseX < 360)
			myX = 0;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*2-1;
			mySize = Math.random()*5;
		}
	}
	public void show()
	{
		fill(myColorR,myColorG,myColorB,(int)myOpacity);
		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
	}
}

class SideParticleY implements Particle
{
	double myX, myY, mySpeed, myTheta, mySize, myOpacity;
	int myColorR, myColorG, myColorB;
	SideParticleY()
	{
		myOpacity = Math.random()*80;
		mySize = Math.random()*5;
		myX= Math.random()*720;
		if(mouseY >= 360)
			myY = 720;
		else if(mouseY < 360)
			myY = 0;
		myTheta = Math.random()*6.28;
		mySpeed = Math.random()*10-5;
		myColorR = (int)(Math.random()*255);
		myColorG = (int)(Math.random()*255);
		myColorB = (int)(Math.random()*255);
	}
	public void move()
	{
		myX = myX + Math.cos(myTheta)*mySpeed + shiftSideX/2;
		myY = myY + Math.sin(myTheta)*mySpeed + shiftSideY/2;
		mySize = mySize + .002;
		myOpacity = myOpacity + .02;
		if (myX >= 720 || myX <= 0)
		{
			myX= Math.random()*720;
			if(mouseY >= 360)
				myY = 720;
			else if(mouseY < 360)
			myY = 0;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*2-1;
			mySize = Math.random()*5;
		}
		else if (myY >= 720 || myY <= 0)
		{
			myX= Math.random()*720;
			if(mouseY >= 360)
				myY = 720;
			else if(mouseY < 360)
			myY = 0;
			myTheta = Math.random()*6.28;
			mySpeed = Math.random()*2-1;
			mySize = Math.random()*5;
		}
	}
	public void show()
	{
		fill(myColorR,myColorG,myColorB,(int)myOpacity);
		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
	}
}
