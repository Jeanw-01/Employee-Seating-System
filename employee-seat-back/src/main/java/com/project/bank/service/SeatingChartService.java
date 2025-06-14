package com.project.bank.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bank.dto.EmployeeDto;
import com.project.bank.dto.SeatStatusDto;
import com.project.bank.entity.Employee;
import com.project.bank.entity.SeatingChart;
import com.project.bank.repository.EmployeeRepository;
import com.project.bank.repository.SeatingChartRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
public class SeatingChartService {
	@PersistenceContext
    private EntityManager entityManager;
	
	@Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private SeatingChartRepository seatingChartRepository;

    @Transactional
    public void updateSeatByEmployee(String empId, int newSeatSeq) {
        entityManager
            .createStoredProcedureQuery("UpdateSeatByEmployee")
            .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
            .registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN)
            .setParameter(1, empId)
            .setParameter(2, newSeatSeq)
            .execute();
    }
    
    public List<EmployeeDto> getAllEmployees() {
        return employeeRepository.findAll().stream()
            .map(emp -> new EmployeeDto(emp.getEmpId(), emp.getName()))
            .collect(Collectors.toList());
    }

    public List<SeatStatusDto> getAllSeats() {
        return seatingChartRepository.findAll().stream()
            .map(seat -> new SeatStatusDto(
            	seat.getId(),
                seat.getFloorNo(),
                seat.getSeatNo(),
                seat.getStatus(),
                employeeRepository.findBySeatId(seat.getId())
                    .map(Employee::getEmpId)
                    .orElse(null)
            ))
            .collect(Collectors.toList());
    }
    
    @Transactional
    public void clearSeatByEmployee(String empId) {
        Employee emp = employeeRepository.findByEmpId(empId)
            .orElseThrow(() -> new RuntimeException("找不到員工"));

        SeatingChart seat = emp.getSeat();
        if (seat != null) {
            emp.setSeat(null); // 解除關聯
            seat.setStatus("空位");

            employeeRepository.save(emp);
            seatingChartRepository.save(seat);
        }
    }
}
