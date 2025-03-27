package com.assignment.Library.hello;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

	// @Controller
	public class hellocontroller {

		
		//"say-hello" => "Hello! What are you learning today?"
		
		//say-hello
		// http://localhost:8080/say-hello
		@RequestMapping("say-hello")
		@ResponseBody
		public String sayHello() {
			return "Hello! What are you learning today?";
		}
		
		@RequestMapping("say-hello-jsp")
		public String sayHelloJsp() {
			return "hello";
		}

	}
