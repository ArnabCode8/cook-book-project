package util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

public class DateDemo {
	
	public String getCurrentDate() {
		
		/*Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String strDate = dateFormat.format(date);*/
		LocalDate date = LocalDate.now();
		
		String strDate = date.toString();
		return strDate;
	}
	
	public String forwardDate(int x)
	{
		LocalDate date = LocalDate.now();
		//System.out.println("now : " + date.toString());
		LocalDate after = date.plusDays(x);
		//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//System.out.println(x + "days after : " + after.toString());
		String strDate = after.toString();
		
	return strDate;	
	}
	
	public String backwardDate(int x)
	{
		LocalDate date = LocalDate.now();
		//System.out.println("now : " + date.toString());
		LocalDate after = date.minusDays(x);
		//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//System.out.println(x + "days after : " + after.toString());
		String strDate = after.toString();
		
	return strDate;	
	}
	
	public int subtract(LocalDate date1,LocalDate date2)
	{
		long days = ChronoUnit.DAYS.between(date1, date2);
		
		return (int)days;
	}
	
	LocalDate strToDate(String date)
	{
		LocalDate date1 = LocalDate.parse(date);
		return date1;
	}
	
	public int subtractDateString(String date1,String date2)
	{
		DateDemo dd = new DateDemo();
		
		LocalDate d1 = dd.strToDate(date1);
		LocalDate d2 = dd.strToDate(date2);
		
		return dd.subtract(d1, d2);
		
		
	}
	
	public static void main(String[] args) {
		
		DateDemo d = new DateDemo();
		LocalDate today = LocalDate.now();
		System.out.println(today.toString());
		LocalDate yesterday = today.minusDays(2);
		LocalDate tomorrow = today.plusDays(2);
	
		String date1 = d.backwardDate(2);
		String date2 = d.getCurrentDate();
		String date3 = d.forwardDate(2);
		
		System.out.println("Date1 : " + date1 + " Date2 : " + date2 + " Date3 : " + date3);
		System.out.println("Diff of date 1 and date 2 : " + d.subtractDateString(date1, date2));
		System.out.println("Diff of date 2 and date 3 : " + d.subtractDateString(date2, date3));
		
		
		
		
		/*
		System.out.println(d.subtract(yesterday, tomorrow));
		System.out.println(d.subtract(tomorrow,yesterday));
		System.out.println(d.strToDate("2020-02-08"));*/
	}

}
