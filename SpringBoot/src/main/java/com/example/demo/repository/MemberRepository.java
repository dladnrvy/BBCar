package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {

	public MemberEntity findByIdx(Long idx);
	public List<MemberEntity> findByUnameLike(String name);
	public List<MemberEntity> findByIdxBetween(Long arg1, Long arg2);
	
	@Query("select d from MemberEntity d oder by d.idx desc")
	public List<MemberEntity> findall();
	
}
