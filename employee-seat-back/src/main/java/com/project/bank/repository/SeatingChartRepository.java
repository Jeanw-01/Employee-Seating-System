package com.project.bank.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.bank.entity.SeatingChart;

public interface SeatingChartRepository extends JpaRepository<SeatingChart, Integer> {
	
}
