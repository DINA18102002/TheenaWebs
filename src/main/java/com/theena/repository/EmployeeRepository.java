package com.theena.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.theena.model.Employee;


@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{

	
	// Find all employees where verified is false
    List<Employee> findByVerifiedFalse();

    // Find an employee by email (returns Optional for safe handling)
    Optional<Employee> findByEmail(String email);
	
    List<Employee> findByVerifiedTrue();
    
}
