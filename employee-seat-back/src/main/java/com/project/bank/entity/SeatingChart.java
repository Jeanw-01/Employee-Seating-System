package com.project.bank.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "SeatingChart")
public class SeatingChart {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "FLOOR_SEAT_SEQ")
    private Integer id;

    @Column(name = "FLOOR_NO", nullable = false)
    private Integer floorNo;

    @Column(name = "SEAT_NO", nullable = false)
    private Integer seatNo;

    @Column(name = "STATUS", length = 10)
    private String status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFloorNo() {
		return floorNo;
	}

	public void setFloorNo(Integer floorNo) {
		this.floorNo = floorNo;
	}

	public Integer getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(Integer seatNo) {
		this.seatNo = seatNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public SeatingChart() {
	}
	
	public SeatingChart(Integer id, Integer floorNo, Integer seatNo, String status) {
		super();
		this.id = id;
		this.floorNo = floorNo;
		this.seatNo = seatNo;
		this.status = status;
	}
}
