package work.generalboard;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import work.user.UserService;

@Controller
public class GeneralBoardController {
	@Resource(name = "generalBoardService")
	private GeneralBoardService generalBoardService;

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value="/work/generalboard/createBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBoard(@ModelAttribute GeneralBoardBean board, HttpServletRequest request){
		
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView();

		String flag = board.getTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/generalboard/boardRegisterC");
		}else if(flag != null){
			//게시글 생성
			generalBoardService.createBoard(board);

			String maxBoardNo = generalBoardService.retrieveMaxBoardNo();

			mv.setViewName("redirect:/work/generalboard/retrieveBoardList.do?maxBoardNo=" + maxBoardNo);
		}

		return mv;
		
	}
	
	@RequestMapping(value="/work/generalboard/goMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){

		return "redirect:/intro/index.jsp";
	}

	@RequestMapping(value="/work/generalboard/retrieveBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String boardNo = request.getParameter("bno");

		Map<String, String> boardParam = new HashMap<String, String>();

		boardParam.put("BNO", boardNo);

		Map<String, String> dsBoard = generalBoardService.retrieveBoard(boardParam);


		mv.addObject("dsBoard", dsBoard);

		mv.setViewName("/generalboard/boardR");

		return mv;
	}

	@RequestMapping(value="/work/generalboard/retrieveBoardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoardList(HttpServletRequest request, Model model, Criteria cri){
		ModelAndView mv = new ModelAndView();
		
		model.addAttribute("dsBoardList", generalBoardService.getListWithPaging(cri));
		
		int total = generalBoardService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		mv.setViewName("/generalboard/boardListR");

		return mv;
	}

	@RequestMapping(value="/work/generalboard/deleteBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String boardNo = request.getParameter("bno");

		boardParam.put("BNO", boardNo);

		generalBoardService.deleteBoard(boardParam);

		mv.setViewName("redirect:/work/generalboard/retrieveBoardList.do");

		return mv;
	}

	@RequestMapping(value="/work/generalboard/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBoard1(HttpServletRequest request, @ModelAttribute GeneralBoardBean board, Criteria cri, Model model){
		Map<String, String> boardParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String boardNo = request.getParameter("bno"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = board.getTitle();
        boardParam.put("BNO", boardNo);

        Map<String, String> dsBoard = generalBoardService.retrieveBoard(boardParam);

		if(flag == null){
			mv.addObject("dsBoard", dsBoard);
			mv.setViewName("/generalboard/boardRegisterU");
		}else{
			generalBoardService.updateBoard(board);
			mv.setViewName("redirect:/work/generalboard/retrieveBoard.do?bno=" + boardNo);
		}
		return mv;
	}

}
