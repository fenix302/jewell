package work.generalboard;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("generalBoardService")
public class GeneralBoardServiceImpl implements GeneralBoardService{
	@Resource(name = "generalBoardDAO")
	private GeneralBoardDAO generalBoardDAO;

	public List<GeneralBoardBean> retrieveBoardList(Criteria cri){
		return generalBoardDAO.retrieveBoardList(cri);
	}
	
	public List<GeneralBoardBean> getListWithPaging(Criteria cri) {
		return generalBoardDAO.getListWithPaging(cri);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return generalBoardDAO.retrieveBoard(boardParam);
	}

	public String retrieveMaxBoardNo(){
		return generalBoardDAO.retrieveMaxBoardNo();
	}

	public void createBoard(GeneralBoardBean board){
		generalBoardDAO.createBoard(board);
	}

	public void updateBoard(GeneralBoardBean board){
		generalBoardDAO.updateBoard(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		generalBoardDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		generalBoardDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		generalBoardDAO.deleteBoard2(boardParam);
	}

	@Override
	public int getTotalCount() {
		return generalBoardDAO.getTotalCount();
	}

}
