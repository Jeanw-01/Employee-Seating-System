package com.project.bank.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Employee")
public class Employee {
	@Id
    @Column(name = "EMP_ID", length = 5)
    private String empId;

    @Column(name = "NAME", nullable = false, length = 50)
    private String name;

    @Column(name = "EMAIL", length = 50)
    private String email;

    @OneToOne // 每位員工只能佔一個座位
    @JoinColumn(name = "FLOOR_SEAT_SEQ", unique = true, foreignKey = @ForeignKey(name = "FK_Seat"))
    private SeatingChart seat;

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public SeatingChart getSeat() {
		return seat;
	}

	public void setSeat(SeatingChart seat) {
		this.seat = seat;
	}

	public Employee() {
	}

	public Employee(String empId, String name, String email, SeatingChart seat) {
		super();
		this.empId = empId;
		this.name = name;
		this.email = email;
		this.seat = seat;
	}
}
