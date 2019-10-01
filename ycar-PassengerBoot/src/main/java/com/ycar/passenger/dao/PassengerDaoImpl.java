package com.ycar.passenger.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.ycar.passenger.entity.PRouteEntity;
import com.ycar.passenger.entity.PassengerEntity;

public class PassengerDaoImpl implements PassengerDao {

	private EntityManager entityManager;

	public PassengerDaoImpl(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}

	@Override
	public PassengerEntity findEnvByIdx(long idx) {

		Query query = entityManager.createQuery("from PassengerEntity where p_idx = " + idx);
		PassengerEntity pe = (PassengerEntity) query.getSingleResult();

		return pe;
	}

	@Override
	public List<PRouteEntity> findRouteByIdx(int idx) {

		Query query = entityManager.createQuery("from PRouteEntity where p_idx = " + idx);
		List<PRouteEntity> pre = query.getResultList();

		return pre;
	}

}
