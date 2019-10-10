package com.example.demo.dao;

import java.io.Serializable;
import java.util.List;

//자바 시스템 내부에서 사용되는 Object 또는 Data를 외부의 자바 시스템에서도 사용할 수 있도록 byte 형태로 데이터를 변환하는 기술 serializable
public interface MemberDao<T> extends Serializable{

	public List<T> getAll();
	public T findByIdx(long idx);
	public List<T> findByUname(String name);
	public List<T> find(String fstr);
}
