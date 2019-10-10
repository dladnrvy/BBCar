package com.example.demo.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MemberDaoImpl;
import com.example.demo.domain.MemberInfo;
import com.example.demo.entity.MemberEntity;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.repository.MemberRepository;

@Controller
public class IndexController {

	@Autowired
	private SqlSessionTemplate template;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private MemberRepository repository;
	
	
	@RequestMapping("/")
	@ResponseBody
	public List<MemberEntity> index() {
		
		List<MemberEntity> list = repository.findall();
		
		return list;
	}
	
	@RequestMapping("/hello")
	public void hello1() {
		
	}
	
	@RequestMapping("/memberInfo")
	public void selectByIdx() {
		
		mapper = template.getMapper(MemberMapper.class);
		
		MemberInfo info = mapper.selectMemberById("uk");
		
		System.out.println(info);
	}
	

	@RequestMapping("/members")
	@ResponseBody
	public List<MemberInfo> selectMembers() {
		
		mapper = template.getMapper(MemberMapper.class);
		
		List<MemberInfo> info =  mapper.selectAll();
		
		for (MemberInfo memberInfo : info) {
			System.out.println(memberInfo);
		}
		
		return info;
				
	}
	
	@RequestMapping("/member/list")
	@ResponseBody
	public List<MemberEntity> getMemberList(){
		
		List<MemberEntity> list = null;
		
		list = repository.findAll();
		
		for(MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
				
		return list;
	}
	
	//추가
	@RequestMapping("/member/insert")
	@ResponseBody
	public String insertMember() {
		
		MemberEntity entity = new MemberEntity();
		entity.setuId("cool");
		entity.setUname("hihi");
		entity.setUpw("12345");
		
		return repository.saveAndFlush(entity).toString();
	}
	
	//수정
	@RequestMapping("/member/edit/{idx}")
	@ResponseBody
	public String editMember(
			@PathVariable("idx") int idx
			) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		entity.setuId("coolhot");
		entity.setUname("hihibye");
		entity.setUpw("1234567");
		
		return repository.saveAndFlush(entity).toString();
	}
	
	//삭제
	@RequestMapping("/member/delete/{idx}")
	@ResponseBody
	public String deleteMember(
			@PathVariable("idx") int idx
			) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		
		repository.delete(entity);
		
		return "delete";
	}
	
	@RequestMapping("/member/member/{idx}")
	@ResponseBody
	public MemberEntity getMemberInfo(
			@PathVariable("idx") long idx
			) {
		
		MemberEntity entity = null;
		
		entity = repository.findByIdx(idx);
		
		System.out.println(entity);
		
		return entity;
	}
	
	@RequestMapping("/member/memberbyname/{name}")
	@ResponseBody
	public List<MemberEntity> getMemberInfo(
			@PathVariable("name") String name
			) {
		
		List<MemberEntity> entitys = null;
		
		entitys = repository.findByUnameLike("%"+name+"%");
		
		for(MemberEntity memberEntity : entitys) {
			System.out.println(memberEntity);
		}
		System.out.println(entitys);
		
		return entitys;
	}
	
	@RequestMapping("/member/memberbybetween")
	@ResponseBody
	public List<MemberEntity> getMemberInfo() {
		
		List<MemberEntity> entitys = null;
		
		entitys = repository.findByIdxBetween(1L, 3L);
		
		for(MemberEntity memberEntity : entitys) {
			System.out.println(memberEntity);
		}
		System.out.println(entitys.isEmpty());
		
		return entitys;
	}
	
	@PersistenceContext
	EntityManager entityManager;
	
	private MemberDaoImpl dao;
	
	public IndexController() {
		this.dao = new MemberDaoImpl(entityManager);
	}
	
	@RequestMapping("/listall")
	@ResponseBody
	public List<MemberEntity> memberListAll(){
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> list = dao.getAll();
		
		for(MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		
		return list;
	}
	
	@RequestMapping("/listbyidx/{idx}")
	@ResponseBody
	public MemberEntity memberByIdx(
			@PathVariable("idx") long idx
			){
		
		this.dao = new MemberDaoImpl(entityManager);
		
		MemberEntity entity = dao.findByIdx(idx);
		
		System.out.println(entity);
		
		return entity;
	}
	
	@RequestMapping("/listbyname/{name}")
	@ResponseBody
	public List<MemberEntity> memberByName(
			@PathVariable("name") String name
			){
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> entity = dao.findByUname(name);
		
		System.out.println(entity);
		
		return entity;
	}
	
	@RequestMapping("/listfind/{str}")
	@ResponseBody
	public List<MemberEntity> memberByStr(
			@PathVariable("str") String str
			){
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> entity = dao.find(str);
		
		System.out.println(entity);
		
		return entity;
	}
	
	
	
	
	
	
	
	
	
}
