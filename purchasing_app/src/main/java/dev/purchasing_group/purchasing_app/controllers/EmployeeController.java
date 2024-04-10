package dev.purchasing_group.purchasing_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1")
public class EmployeeController {

//    @Autowired
//    private EmployeeService employeeService;

    @GetMapping(value = "/employees")
    @ResponseStatus(HttpStatus.OK)
    public String testMethod() {
        // return employeeService.employees();
        return "testing the controller";
    }
//
    @GetMapping(value = "/employees/{id}")
    @ResponseStatus(HttpStatus.OK)
    public <EmployeeDTO> EmployeeDTO employee(@PathVariable(value = "id") Integer empId) {
        // return employeeService.employee(empId);
    }

    @PostMapping(value = "/employees")
    @ResponseStatus(HttpStatus.CREATED)
    public EmployeeDTO save(@RequestBody EmployeeRequest emp) {
        // return employeeService.save(emp);
    }

    @DeleteMapping(value = "/employees")
    @ResponseStatus(HttpStatus.OK)
    public String deleteAll() {
        // return employeeService.deleteAll();
    }

    @DeleteMapping(value = "/employees/{id}")
    @ResponseStatus(HttpStatus.OK)
    public String delete(@PathVariable(value = "id") Integer empId) {
        // return employeeService.delete(empId);
    }

    @PutMapping(value = "/employees")
    @ResponseStatus(HttpStatus.OK)
    public EmployeeDTO update(@RequestBody EmployeeRequest emp) {
        // return employeeService.update(emp);
    }
}