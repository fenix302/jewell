package work.generalboard;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GeneralBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<GeneralBoardBean> retrieveBoardList(Criteria cri){
		return sqlSession.selectList("generalboard.retrieveBoardList", cri);
	}

	public List<GeneralBoardBean> getListWithPaging(Criteria cri){
		return sqlSession.selectList("generalboard.getListWithPaging", cri);
	}
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return sqlSession.selectOne("generalboard.retrieveBoard", boardParam);
	}

	public String retrieveMaxBoardNo(){
		return sqlSession.selectOne("generalboard.retrieveMaxBoardNo");
	}

	public void createBoard(GeneralBoardBean board){
		sqlSession.insert("generalboard.createBoard", board);
	}

	public void updateBoard(GeneralBoardBean board){
		sqlSession.update("generalboard.updateBoard", board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("generalboard.updateBoardHits", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("generalboard.deleteBoard", boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		sqlSession.delete("generalboard.deleteBoard2", boardParam);
	}
	
	public int getTotalCount() {
		return sqlSession.selectOne("generalboard.getTotalCount");
	}
}
