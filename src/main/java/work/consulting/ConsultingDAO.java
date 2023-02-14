package work.consulting;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConsultingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ConsultingBean> retrieveBoardList(Criteria cri){
		return sqlSession.selectList("consulting.retrieveBoardList", cri);
	}

	public List<ConsultingBean> getListWithPaging(Criteria cri){
		return sqlSession.selectList("consulting.getListWithPaging", cri);
	}
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return sqlSession.selectOne("consulting.retrieveBoard", boardParam);
	}

	public String retrieveMaxBoardNo(){
		return sqlSession.selectOne("consulting.retrieveMaxBoardNo");
	}

	public void createBoard(ConsultingBean board){
		sqlSession.insert("consulting.createBoard", board);
	}

	public void updateBoard(ConsultingBean board){
		sqlSession.update("consulting.updateBoard", board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("consulting.updateBoardHits", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("consulting.deleteBoard", boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		sqlSession.delete("consulting.deleteBoard2", boardParam);
	}
	
	public int getTotalCount() {
		return sqlSession.selectOne("consulting.getTotalCount");
	}
}
