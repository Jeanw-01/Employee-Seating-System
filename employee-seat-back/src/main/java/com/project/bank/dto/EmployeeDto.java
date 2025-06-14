package com.project.bank.dto;

public class EmployeeDto {
	private String empId;
    private String name;

    public EmployeeDto(String empId, String name) {
        this.empId = empId;
        this.name = name;
    }

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
}
