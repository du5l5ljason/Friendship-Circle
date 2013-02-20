
String inputFile = "Monica.txt";
String stopWordFile = "data/stopword-list.txt";

WordStemMap wordstemMap = new WordStemMap();

StopWordFinder stopWordFinder = new StopWordFinder();
Stemmer stemmer = new Stemmer();

// Set up a cleaner
CleanStringUtil cleaner = new CleanStringUtil();

PrintWriter output;


void setup()
{
   // Load up the stopworder
   setupStopworder();
  
   // Read in the data 
   readData();
   
   size( 100, 100 );
  
   println( "total:" + wordstemMap.getTotalWords() );
   String lines = wordstemMap.output();
   print( lines );
  
   printFile( "output/words.csv", "total," + wordstemMap.getTotalWords() + "\n" + lines );
  
   lines = wordstemMap.outputValueSorted();

   printFile( "output/wordsOrdered.csv", "total," + wordstemMap.getTotalWords() + "\n" + lines );
  
   noLoop();
}

void printFile( String name, String contents )
{
   output = createWriter( name );
   
   output.println( contents );
   output.flush(); // Write the remaining data
   output.close(); // Finish the file
  
}


void draw()
{
  
}

// Read in the data
void setupStopworder() {
  String[] lines = loadStrings( stopWordFile );
  
  stopWordFinder.setStopWordMap( lines );
}



// Read in the data
void readData() {
  String[] lines = loadStrings( inputFile );
  
  for (int i = 0; i < lines.length; i++) {
     processLine( lines[i] ) ;
  }
}

void processLine( String in ) 
{
  if( in == null || in.length() < 1 ) return;

  
  // Now tokenize the sentences   
  String[] words = cleaner.textToTokens( in , true );
  
  // Try adding to the wordMap

  for( int i = 0; i < words.length; i++ )
  {
    // Get the current word
    String word = words[i];

    // Now check if its a stop word

    if( !stopWordFinder.isStopWord( word ) )
    {
      String stem = stemmer.stripAffixes( words[i] );
      
      wordstemMap.addToMap( stem, word );
    }
  }
  
}

