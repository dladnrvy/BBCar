package com.ny.driver.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ny.driver.entity.PassengerEntity;

public interface PasngrRepository extends JpaRepository<PassengerEntity, Long>{

}
