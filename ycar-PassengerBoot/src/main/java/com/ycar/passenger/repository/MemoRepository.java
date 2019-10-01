package com.ycar.passenger.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ycar.passenger.entity.MemoEntity;

public interface MemoRepository extends JpaRepository<MemoEntity, Long> {
	
	// 카풀 선택하여 메모 작성 : pIdx = 회원번호 / cIdx = 카풀등록번호
//	@Query("insert into MemoEntity (p_idx, dr_idx, context) values (:pIdx, :dIdx, :memo)")
//	public int writeMemo(@Param("pIdx")long pIdx, @Param("dIdx")long dIdx, @Param("memo")String memo);
//		 SpEL문
//		 @Query("insert into MemoEntity values p_idx = :#{#memo.pIdx}, dr_idx = :#{#memo.dIdx}, context = :#{#memo.context}")
//		 public int writeMemo(@Param("memo") Memo memo);
	
	// 작성한 메모에 대한 카풀이 예약 되었는지 확인 : Y 예약됨 / B 예약 대기
	
	// 메모 수정
	
	// 메모 삭제
}
