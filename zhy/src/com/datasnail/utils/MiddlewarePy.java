package com.datasnail.utils;

import java.io.IOException;

import org.python.util.PythonInterpreter;

public class MiddlewarePy {
	public void pachong() {

        try {
			Runtime.getRuntime().exec("cmd /k start  C:\\Users\\zhy\\Desktop\\MicroBlog\\test.bat").waitFor();
		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
