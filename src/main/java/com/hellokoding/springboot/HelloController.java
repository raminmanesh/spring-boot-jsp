package com.hellokoding.springboot;

import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	static List<Person> persons = new ArrayList<>();
	
    @RequestMapping("/")
    public String home(Model model) {
    	model.addAttribute("persons", persons);
        return "hello";
    }
    
    @ResponseBody
    @RequestMapping(value="/addperson", method=RequestMethod.POST)
    public List<Person> addPerson(@RequestBody Person person) {
    	try {
    		persons.add(person); 
    		return persons;
    	}catch (Exception e) {
    		e.printStackTrace();
    		return null;
		}
    }
}
