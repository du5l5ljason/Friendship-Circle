class StopWordFinder{
  
	TokenMap stopwordMap = new TokenMap();

	public void setStopWordMap( String [] tokens )
	{
		stopwordMap.addToMap( tokens ); 
	}

	public void setStopWordMap( File file )
	{
		stopwordMap.addToMap( file ); 
	}


	/*************************************
	 *			IDENTIFICATION
	 *************************************/	

	public boolean isStopWord( String token )
	{
	    return stopwordMap.contains( token ) ;
	}

	public ArrayList identifyStopWords( String input )
	{
		ArrayList found = new ArrayList();

		int currentPosition = 0;

                CleanStringUtil cleaner = new CleanStringUtil();

		String [] tokens = cleaner.textToTokens( input, false );

		for( int i = 0; i < tokens.length; i++ )
		{
			if( isStopWord( tokens[i] ) )
			{
				found.add( tokens[i] ); 
			}
		}

		return found;

	}

}
