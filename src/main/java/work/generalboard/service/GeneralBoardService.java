package work.generalboard.service;

import work.generalboard.domain.GeneralBoardVO;

public interface GeneralBoardService {
	
	public void register(GeneralBoardVO board);
	
	public GeneralBoardVO get(Long bno);
	
	public boolean modify(GeneralBoardVO board);
	
	public boolean remove(Long bno);
}
