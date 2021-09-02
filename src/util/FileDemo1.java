package util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import org.apache.catalina.connector.ClientAbortException;

public class FileDemo1 
{
	
	public void writeToFile(String str,String loc)
	{
		FileWriter fw;
		try 
		{
			fw = new FileWriter(loc);
			fw.write(str);
			fw.close();
			System.out.println("Operation Successful");
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public String readFromFile(String loc)
	{
		FileReader fr;
		String str = "";
		
		try 
		{
			fr = new FileReader(loc);
			int i;
			while((i=fr.read()) != - 1)
			{
				str = str + (char)i;
			}
			
			fr.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return str;	
	}
	
	
	public void clearTextFromFile(String loc)
	{
		try 
		{
			PrintWriter writer = new PrintWriter(loc);
			writer.print("");
			writer.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) 
	{
		String loc = "C:\\Users\\Arnab\\eclipse-workspace\\CookBookProject\\WebContent\\myFolder\\tempRecipe.txt";
		String str = "My name is Arnab Das, I was a student from IIT kharagpur";
		
		
		FileDemo1 fd = new FileDemo1();
		//fd.clearTextFromFile(loc);
		//fd.writeToFile(str, loc);
		String output = fd.readFromFile(loc);
		
		System.out.println("Content of the file is : " + output);
       		
	}

}
