package work.consulting;

import java.util.List;
import java.util.Map;


public interface ConsultingService {
	public List<ConsultingBean> retrieveBoardList(Criteria cri);

	public List<ConsultingBean> getListWithPaging(Criteria cri);
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam);

	public String retrieveMaxBoardNo();

	public void createBoard(ConsultingBean board);

	public void updateBoard(ConsultingBean board);

	public void updateBoardHits(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
	public void deleteBoard2(Map<String, String> boardParam);
	
	public int getTotalCount();
}
