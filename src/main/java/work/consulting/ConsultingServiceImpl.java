package work.consulting;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("consultingService")
public class ConsultingServiceImpl implements ConsultingService{
	@Resource(name = "consultingDAO")
	private ConsultingDAO consultingDAO;

	public List<ConsultingBean> retrieveBoardList(Criteria cri){
		return consultingDAO.retrieveBoardList(cri);
	}
	
	public List<ConsultingBean> getListWithPaging(Criteria cri) {
		return consultingDAO.getListWithPaging(cri);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return consultingDAO.retrieveBoard(boardParam);
	}

	public String retrieveMaxBoardNo(){
		return consultingDAO.retrieveMaxBoardNo();
	}

	public void createBoard(ConsultingBean board){
		consultingDAO.createBoard(board);
	}

	public void updateBoard(ConsultingBean board){
		consultingDAO.updateBoard(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		consultingDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		consultingDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		consultingDAO.deleteBoard2(boardParam);
	}

	@Override
	public int getTotalCount() {
		return consultingDAO.getTotalCount();
	}

}
