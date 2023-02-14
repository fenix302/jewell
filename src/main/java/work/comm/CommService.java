package work.comm;

import java.util.List;
import java.util.Map;


public interface CommService {
	public List<CommBean> retrieveBoardList(Criteria cri);

	public List<CommBean> getListWithPaging(Criteria cri);
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam);

	public String retrieveMaxBoardNo();

	public void createBoard(CommBean board);

	public void updateBoard(CommBean board);

	public void updateBoardHits(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
	public void deleteBoard2(Map<String, String> boardParam);
	
	public int getTotalCount();
}
