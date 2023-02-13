package work.comm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("commService")
public class CommServiceImpl implements CommService{
	@Resource(name = "commDAO")
	private CommDAO commDAO;

	public List<Map<String, String>> retrieveBoardList(Map<String, String> boardParam){
		return commDAO.retrieveBoardList(boardParam);
	}
	
	public List<Map<String, String>> getListWithPaging(Map<String, String> boardParam) {
		return commDAO.getListWithPaging(boardParam);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return commDAO.retrieveBoard(boardParam);
	}

	public String retrieveMaxBoardNo(){
		return commDAO.retrieveMaxBoardNo();
	}

	public void createBoard(CommBean board){
		commDAO.createBoard(board);
	}

	public void updateBoard(CommBean board){
		commDAO.updateBoard(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		commDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		commDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		commDAO.deleteBoard2(boardParam);
	}
}
