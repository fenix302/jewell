package work.generalboard;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("generalBoardService")
public class GeneralBoardServiceImpl implements GeneralBoardService{
	@Resource(name = "generalDAO")
	private GeneralBoardDAO generalDAO;

	public List<GeneralBoardBean> retrieveBoardList(Criteria cri){
		return generalDAO.retrieveBoardList(cri);
	}
	
	public List<GeneralBoardBean> getListWithPaging(Criteria cri) {
		return generalDAO.getListWithPaging(cri);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return generalDAO.retrieveBoard(boardParam);
	}

	public String retrieveMaxBoardNo(){
		return generalDAO.retrieveMaxBoardNo();
	}

	public void createBoard(GeneralBoardBean board){
		generalDAO.createBoard(board);
	}

	public void updateBoard(GeneralBoardBean board){
		generalDAO.updateBoard(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		generalDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		generalDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		generalDAO.deleteBoard2(boardParam);
	}

	@Override
	public int getTotalCount() {
		return generalDAO.getTotalCount();
	}

}
