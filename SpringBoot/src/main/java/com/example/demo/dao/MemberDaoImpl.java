package com.example.demo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.example.demo.entity.MemberEntity;

public class MemberDaoImpl implements MemberDao<MemberEntity> {

	private EntityManager entityManager;
	
	public MemberDaoImpl() {};
	
	public MemberDaoImpl(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}

	@Override
	public List<MemberEntity> getAll() {
		
		Query query = entityManager.createQuery("from MemberEntity");
		
		//여러개의 결과값을 받을때 result
		List<MemberEntity> list = query.getResultList();
		
		entityManager.close();
		
		return list;
	}

	@Override
	public MemberEntity findByIdx(long idx) {
		
		Query query = entityManager.createQuery("from MemberEntity where idx =" + idx);
		//하나의 결과값을 받을때 single
		MemberEntity entity = (MemberEntity)query.getSingleResult();
		return entity;
	}

	@Override
	public List<MemberEntity> findByUname(String name) {
		
		Query query = entityManager.createQuery("from MemberEntity where uname='"+name +"'");
		List<MemberEntity> list = query.getResultList();
		
		return list;
	}

	@Override
	public List<MemberEntity> find(String fstr) {
		
		List<MemberEntity> list = null;
		
		String qSql = "from MemberEntity where idx = :fidx" + "or uname like :fname "+ "or uid like :fid";
		
		Long fIdx = 0L;
		try {
			fIdx = Long.parseLong(fstr); 
		}catch(Exception e) {}
		
		/*
		 * Query query = entityManager.createQuery(qSql) .setParameter("fidx", fIdx)
		 * .setParameter("fname", "%"+fstr+"%") .setParameter("fid", "%"+fstr+"%");
		 */
		
		Query query = entityManager.createQuery("findWithParam")
				.setParameter("fidx", fIdx)
				.setParameter("fname", "%"+fstr+"%")
				.setParameter("fid", "%"+fstr+"%");
		
		list = query.getResultList();
		
		return list;
	}

}
