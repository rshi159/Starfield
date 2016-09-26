NormalParticle[] group;//your code here
void setup()
{
	size(720,720);//your code here
	group = new NormalParticle[10];
	for(int i = 0; i < group.length; i++)
	{
		group[i] = new NormalParticle();
	}
}
void draw()
{
	background(45);
	for...
	group[i].move();
	group[i].show();//your code here
}
class NormalParticle
{
	double myX, myY, mySpeed, myTheta;
	int myColor;
	NormalParticle()
	{
		myX = 360;
		myY = 360;
		myTheta = 2;
		mySpeed = 5;
		myColor = (int)(Math.random()*255);
	}
	void move()
	{
		myX = myX + Math.cos(myTheta)*mySpeed;
		myY = myY + Math.sin(myTheta)*mySpeed;
	}
	void show()
	{
		fill(255,0,0);
		ellipse((float)myX, (float)myY, 25, 25);
	}
	//your code here
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

