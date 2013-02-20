PImage circosImage;
String inputImgFile = "Friendship.png";
String inputFile = "Monica.csv";
String stopWordFile = "data/stopword-list.txt";
String[] lines;
String[] words;
int[] wordDensity;
int index = 0;
int wordId = 0;
int dataMin = 30;      //the lower threshold for the word that could be selected.
int dataMax = 300;

StopWordFinder stopWordFinder = new StopWordFinder();

void setup(){
  setupStopWorder();
  
  size(1200,800);
  circosImage = loadImage(inputImgFile);
  //circosImage.resize(800,800);
  lines = loadStrings(inputFile);
  
  
}

void setupStopWorder()
{
  String[] stoplines = loadStrings( stopWordFile );
  stopWordFinder.setStopWordMap( stoplines );
  
}
void draw(){
  background(255);
  image(circosImage, 0, 0);
  
  //Scan files, save the key words in the string array.
  words = new String[lines.length];
  wordDensity = new int[lines.length];
  while(index < lines.length){
    String[] pieces = split(lines[index],',');
    if(pieces.length == 2){
    if( Integer.parseInt(pieces[1])>=dataMin && index !=0 && (!stopWordFinder.isStopWord(pieces[0]))){
      
      words[wordId] = pieces[0];
      wordDensity[wordId] = Integer.parseInt(pieces[1]);
       println("words length: "+words[wordId]+"\n");
      wordId = wordId + 1;
    }
  }
    index = index + 1;
  }
  
  //Drawing attributes for the ecllipses
  smooth();
  fill(192,0,0);
  noStroke();
  for(int i = 0 ; i<wordId-1 ; i++)
  {
    float x = random(0,10)*40 ;
    float y = random(10,20)*40 ;
    drawData(x, y, words[i],wordDensity[i]);
  }
  
  

}

void drawData(float x, float y,String word, int value)
{
  float radius = 0;
  radius = map(value, dataMin, dataMax, 10, 50);
  fill(#00FF00);
  
  ellipseMode(RADIUS);
  ellipse(x, y, radius, radius);
  fill(0);
  textAlign(CENTER,CENTER);
  text(word, x, y);
}
