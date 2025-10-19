package iuh.fit.se.bai1.controllers;


import iuh.fit.se.bai1.entities.Employee;
import iuh.fit.se.bai1.services.EmployeeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller

public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping
    public ModelAndView getList(ModelAndView modelAndView) {
        List<Employee> employees = employeeService.findAll();

        modelAndView.addObject("employees", employees);
        modelAndView.setViewName("list");
        return modelAndView;
    }

    @GetMapping("/save")
    public String showForm(Model  model) {
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        return "register";
    }

    @PostMapping("/save")
    public String save(@Valid @ModelAttribute Employee employee, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "register";
        }else{
            employeeService.save(employee);
        }
        return "redirect:/";

    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        employeeService.deleteById(id);
        return "redirect:/";
    }

    @GetMapping("/search")
    public ModelAndView search(@RequestParam("keyword") String keyword, ModelAndView modelAndView) {
        List<Employee> employees = employeeService.search(keyword);
        modelAndView.addObject("employees", employees);
        modelAndView.setViewName("list");
        return modelAndView;
    }


    @GetMapping("/update")
    public ModelAndView showFormUpdate(@RequestParam("employeeId") int id, ModelAndView modelAndView) {
        Employee employee = employeeService.findById(id);

        if(employee == null) {
            modelAndView.setViewName("error");
            modelAndView.addObject("errorMessage", "Employee - not found");
        }
        else {
            modelAndView.addObject("employee", employee);
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }
}
