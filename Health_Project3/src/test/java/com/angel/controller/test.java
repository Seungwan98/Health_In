package com.angel.controller;

import org.junit.Test;

public class test {
	
	@Test
	public void test() {
		
		
		String a="123,45 원";
		a=a.replace(",","");
		a=a.replace("원", "");
		a=a.replace(" ", "");
		
		System.out.println(Integer.parseInt(a));
		
	}

}
