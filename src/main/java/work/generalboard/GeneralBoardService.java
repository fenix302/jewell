package work.generalboard;

import java.util.List;
import java.util.Map;


public interface GeneralBoardService {
	public List<GeneralBoardBean> retrieveBoardList(Criteria cri);

	public List<GeneralBoardBean> getListWithPaging(Criteria cri);
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam);

	public String retrieveMaxBoardNo();

	public void createBoard(GeneralBoardBean board);

	public void updateBoard(GeneralBoardBean board);

	public void updateBoardHits(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
	public void deleteBoard2(Map<String, String> boardParam);
	
	public int getTotalCount();
}
