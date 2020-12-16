package org.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements IF_MemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectMember(String search_type, String search_keyword) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		//매개변수를 1개로 만들어서 값을 2개 집어넣는 방식 - 해시데이터를 만들어 구현
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("search_type", search_type);
		paramMap.put("search_keyword", search_keyword);
		return sqlSession.selectList("memberMapper.selectMember", paramMap);
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.insert("memberMapper.insertMember", memberVO);
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.delete("memberMapper.deleteMember", user_id);
	}

	@Override
	public MemberVO readMember(String user_id) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		return sqlSession.selectOne("memberMapper.readMember", user_id);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.update("memberMapper.updateMember", memberVO);
	}

}
