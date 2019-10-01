package com.parboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.parboot.entity.ReservationEntity;

public interface ReservationRepository extends JpaRepository<ReservationEntity, Long> {

}
