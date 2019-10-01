package com.ycar.passenger.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ycar.passenger.entity.DriverEntity;

public interface DriverRepository extends JpaRepository<DriverEntity, Integer> {

}
