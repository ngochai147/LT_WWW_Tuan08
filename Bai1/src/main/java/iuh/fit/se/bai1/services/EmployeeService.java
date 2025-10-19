package iuh.fit.se.bai1.services;

import iuh.fit.se.bai1.entities.Employee;

import java.util.List;

public interface EmployeeService {
    public void save(Employee employee);
    public Employee findById(int id);
    public List<Employee> findAll();
    void deleteById(int id);
    List<Employee> search(String keyword);

}
