package work.generalboard;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service("generalBoardService")
@AllArgsConstructor
public class GeneralBoardServiceImpl implements GeneralBoardService{

	@Override
	public void register(GeneralBoardVO board) {
		
		
	}

	@Override
	public GeneralBoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(GeneralBoardVO board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<GeneralBoardVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
