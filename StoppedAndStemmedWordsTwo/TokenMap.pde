class TokenMap{
  
  HashMap map = new HashMap();

	void addToMap( File fileName )
	{
		try {
			//use buffering, reading one line at a time
			//FileReader always assumes default encoding is OK!
			BufferedReader input =  new BufferedReader(new FileReader(fileName));
			try {
				String line = null; //not declared within while loop

				while (( line = input.readLine()) != null){
					String [] stringParts = line.split( " " );
					
					if( stringParts.length > 1 )
						addToMap( stringParts[0], stringParts[1] );
					else
						addToMap( stringParts[0] );
				}
			}
			finally {
				input.close();
			}
		}
		catch (IOException ex){
			ex.printStackTrace();
		}
		
	}
	
	void addToMap( String [] tokens )
	{
		for( int i = 0; i < tokens.length; i++ )
		{
			addToMap( tokens[i] );
		}
	}
	
	void addToMap( String token )
	{
		map.put( token.toLowerCase() , token.toLowerCase() );
	}	
	
	void addToMap( String token, String value )
	{
		map.put( token.toLowerCase() , value.toLowerCase() );
	}		
	
	void removeToMap( String token )
	{
		map.remove( token.toLowerCase() );
	}
	
	String getFromMap( String key )
	{
		return map.get( key.toLowerCase() ).toString();	
	}
	
	boolean contains( String token )
	{
		return map.containsKey( token.toLowerCase() );
	}  

}
