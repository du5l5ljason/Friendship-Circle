//
//  PersonNameIdentifier.java
//  lexi4twitter
//
//  Created by Daragh Byrne on 17/08/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
import java.util.HashMap;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.File;

class CleanStringUtil 
{
	
	String[] textToTokens( String text, boolean cleanFirst )
	{
		if( cleanFirst )
		{
			text = removeAllPunctuation( text.toLowerCase() );
			text = removeCharacterReturns( text.toLowerCase() );
		}
		text = text.replace( "   ", " " );
		text = text.replace( "  ", " " );
		return text.split( " " );
	}
	
	String removeCharacterReturns( String string )
	{
		String regex = "/(\r|\n)/gi";
		return string.replaceAll( regex , " " ); 
	}
	
	
	String removeAllPunctuation( String string )
	{
		//String regex =  "[a-zA-Z_0-9]";
                String regex = "[^A-Za-z]";
		return string.replaceAll( regex , " " ); 
		
	}	
	
	String removeBasicPunctuation( String string )
	{
		String regex =  "[!?.,\\*\"'<>:]";
		return string.replaceAll( regex , " " ); 
	}

	String removeTrailingPunctuation( String string )
	{
		String regex =  "[!?.,\\*\"<>:]";
		return string.replaceAll( regex , " " ); 
	}	
	
	String removeAlphaNumeric( String string ) 
	{
		String regex =  "[a-zA-Z_0-9]";
		string = string.replaceAll( regex , " " ); 
		return string;
	}
	
}

