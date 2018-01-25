package com.test;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.main.action.LoginAction;

public class TestLog {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Log log = LogFactory.getLog(LoginAction.class.getName());
		
		System.out.println("aaaaaaaaaaaaa");
		log.error("aaaaaa");

		
	}

}
