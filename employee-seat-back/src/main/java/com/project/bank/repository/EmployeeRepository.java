package com.project.bank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.bank.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, String> {
	Optional<Employee> findByEmpId(String empId);
	
	@Query("SELECT e FROM Employee e WHERE e.seat.id = :seatId")
    Optional<Employee> findBySeatId(@Param("seatId") Integer seatId);
}
