package work.comm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("commService")
public class CommServiceImpl implements CommService{
	@Resource(name = "commDAO")
	private CommDAO commDAO;

	public List<CommBean> retrieveBoardList(Criteria cri){
		return commDAO.retrieveBoardList(cri);
	}
	
	public List<CommBean> getListWithPaging(Criteria cri) {
		return commDAO.getListWithPaging(cri);
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

	@Override
	public int getTotalCount() {
		return commDAO.getTotalCount();
	}

}
