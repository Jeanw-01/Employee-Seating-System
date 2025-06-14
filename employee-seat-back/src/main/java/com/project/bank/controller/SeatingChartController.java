package com.project.bank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.bank.dto.EmployeeDto;
import com.project.bank.dto.SeatStatusDto;
import com.project.bank.dto.SeatUpdateRequest;
import com.project.bank.service.SeatingChartService;

@RestController
@RequestMapping("/seating")
public class SeatingChartController {
	@Autowired
    private SeatingChartService seatingService;

    @PostMapping("/update")
    public ResponseEntity<String> updateSeat(@RequestBody SeatUpdateRequest request) {
        try {
            seatingService.updateSeatByEmployee(request.getEmpId(), request.getSeatSeq());
            return ResponseEntity.ok("更新成功！");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("更新失敗: " + e.getMessage());
        }
    }
    
    @GetMapping("/employees")
    public List<EmployeeDto> getAllEmployees() {
        return seatingService.getAllEmployees();
    }

    @GetMapping("/seats")
    public List<SeatStatusDto> getAllSeats() {
        return seatingService.getAllSeats();
    }
    
    @DeleteMapping("/clear/{empId}")
    public ResponseEntity<String> clearSeat(@PathVariable String empId) {
        try {
            seatingService.clearSeatByEmployee(empId);
            return ResponseEntity.ok("已清除座位");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("清除失敗: " + e.getMessage());
        }
    }
}
