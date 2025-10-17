package iuh.fit.se.bai1.repositories;


import iuh.fit.se.bai1.entities.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
}
