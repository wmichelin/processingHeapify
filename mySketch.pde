int num = 10;
int[] arr = new int[10];
int[][] posArray = {{400, 150}, {250, 250}, {550, 250}, {150, 350}, {310, 350}, {500, 350}, {600, 350}, {80, 450}, {180, 450}, {280, 450}};

int fr = 2;

Node[] balls = new Node[num];
int tempX = 100;
int counter;

void setup() 
{
  for(int i = 0; i < 10; i++)
  {
  		arr[i] = round(random(0, 20));
  }

  frameRate(fr);
  size(800, 550);
  noStroke();
  smooth();

  int x = 30;
  int y = 30;
  for(int i = 0; i < num; i++)
  {
  	balls[i] = new Node(arr[i], x, y, i);
  	x += 40;
  	y += 40;
  }
  counter = (int)Math.floor( arr.length - 1 ) ;
}

void draw()
{
	
	
	background(0);
	drawLines();

	if(tempX > 800)
	{
		tempX = 0;
	}
	for(int i = 0; i < num; i++)
	{
		balls[i].setWeight(arr[i]);
		balls[i].update();
		fill(200);
		text(arr[i], 200 + i*40, 50);
		tempX += 20;
	}
	if(counter >= 0)
	{
		MaxHeapify(arr, counter);
		counter --;
	}
	
}


void MaxHeapify( int[ ] arr, int i )
{
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    int largest = i;

    if( left < arr.length && arr[ left ] > arr[ largest ] )
        largest = left;
    if( right < arr.length && arr[ right ] > arr[ largest ] )
        largest = right;
    if( largest != i )
    {
        int temp = arr[ i ];
        arr[ i ] = arr[ largest ];
        arr[ largest ] = temp;

        MaxHeapify( arr, largest );
    }
}




void drawLines()
{
	stroke(200);
	line(posArray[0][0], posArray[0][1], posArray[1][0], posArray[1][1]);
	line(posArray[0][0], posArray[0][1], posArray[2][0], posArray[2][1]);
	line(posArray[1][0], posArray[1][1], posArray[3][0], posArray[3][1]);
	line(posArray[1][0], posArray[1][1], posArray[4][0], posArray[4][1]);
	line(posArray[3][0], posArray[3][1], posArray[7][0], posArray[7][1]);
	line(posArray[3][0], posArray[3][1], posArray[8][0], posArray[8][1]);
	line(posArray[4][0], posArray[4][1], posArray[9][0], posArray[9][1]);
	line(posArray[2][0], posArray[2][1], posArray[5][0], posArray[5][1]);
	line(posArray[2][0], posArray[2][1], posArray[5][0], posArray[5][1]);
	line(posArray[2][0], posArray[2][1], posArray[6][0], posArray[6][1]);
}

class Node{
	int weight;
	int index;
	float x, y;
	Node(int inWeight, float xIn, float yIn, int ind){
		weight = inWeight;
		x = xIn;
		y = yIn;
		index = ind;
	}
	void update()
	{
		int xPos = posArray[index][0];
		int yPos = posArray[index][1];
		setColor(weight);
		ellipse(xPos, yPos, 40, 40);
		fill(0);
		text(weight, xPos, yPos);
	}

	void setWeight(int newWeight)
	{
		weight = newWeight;
	}


}

void setColor(int weight)
{
	switch(weight)
	{
		case 0:
			fill(255, 0, 0);
			break;
		case 1:
			fill(255, 128, 0);
			break;
		case 2: 
			fill(255, 255, 0);
			break;
		case 3: 
			fill(128, 255, 0);
			break;
		case 4:
			fill(0, 255, 0);
			break;
		case 5: 
			fill(0, 255, 128);
			break;
		case 6: 
			fill(0, 255, 255);
			break;
		case 7: 
			fill(0, 128, 255);
			break;
		case 8:
			fill(0, 0, 255);
			break;
		case 9:
			fill(127, 0, 255);
			break;
		case 10: 
			fill(255, 0, 255);
			break;
		case 11: 
			fill(255, 0, 127);
			break;

		case 12:
			fill(255, 102, 102);
			break;
		case 13:
			fill(255, 178, 102);
			break;
		case 14: 
			fill(255, 255, 102);
			break;
		case 15: 
			fill(178, 255, 102);
			break;
		case 16:
			fill(102, 255, 102);
			break;
		case 17: 
			fill(102, 255, 178);
			break;
		case 18: 
			fill(102, 255, 255);
			break;
		case 19: 
			fill(102, 178, 255);
			break;
		case 20:
			fill(102, 102, 255);
			break;
		default:
			fill(255, 0, 0);

	}
}




