package iuh.fit.se.bai1.services.impl;

import iuh.fit.se.bai1.entities.Employee;
import iuh.fit.se.bai1.repositories.EmployeeRepository;
import iuh.fit.se.bai1.services.EmployeeService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    EmployeeRepository employeeRepository;

    @Autowired
    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Transactional
    @Override
    public void save(Employee employee) {
        this.employeeRepository.save(employee);
    }

    @Override
    public Employee findById(int id) {
        return this.employeeRepository.findById(id).orElse(null);
    }

    @Override
    public List<Employee> findAll() {
        return this.employeeRepository.findAll();
    }
}
