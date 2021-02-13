package kh.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ProfessorDTO;
import kh.spring.dto.StudentsDTO;

@Repository
public class MyPageDAO {
	@Autowired
	private SqlSession db;
	
	public List<StudentsDTO> myInfoStu(int id){
		return db.selectList("MyPage.myInfoStu", id);
	}
	public int updateMyInfoStu(List<StudentsDTO> list) {
		return db.update("MyPage.updateMyInfoStu", list);
	}
	public List<ProfessorDTO> myInfoPro(int id){
		return db.selectList("MyPage.myInfoPro", id);
	}
	public int updateMyInfoPro(List<ProfessorDTO> list) {
		return db.update("MyPage.updateMyInfoPro", list);
	}

}
