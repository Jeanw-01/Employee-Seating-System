package com.project.bank.dto;

public class SeatStatusDto {
	private int id;
	private int floorNo;
    private int seatNo;
    private String status;
    private String empId;

	public SeatStatusDto(int id, int floorNo, int seatNo, String status, String empId) {
		super();
		this.id = id;
		this.floorNo = floorNo;
		this.seatNo = seatNo;
		this.status = status;
		this.empId = empId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFloorNo() {
		return floorNo;
	}

	public void setFloorNo(int floorNo) {
		this.floorNo = floorNo;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}
}
