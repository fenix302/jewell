package work.consulting;

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
public class ConsultingController {
	@Resource(name = "consultingService")
	private ConsultingService consultingService;

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value="/work/consulting/createBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBoard(@ModelAttribute ConsultingBean board, HttpServletRequest request){
		
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView();

		String flag = board.getTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/consulting/boardRegisterC");
		}else if(flag != null){
			//게시글 생성
			consultingService.createBoard(board);

			String maxBoardNo = consultingService.retrieveMaxBoardNo();

			mv.setViewName("redirect:/work/consulting/retrieveBoardList.do?maxBoardNo=" + maxBoardNo);
		}

		return mv;
		
	}
	
	@RequestMapping(value="/work/consulting/goMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){

		return "redirect:/intro/index.jsp";
	}

	@RequestMapping(value="/work/consulting/retrieveBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String boardNo = request.getParameter("bno");

		Map<String, String> boardParam = new HashMap<String, String>();

		boardParam.put("BNO", boardNo);

		Map<String, String> dsBoard = consultingService.retrieveBoard(boardParam);


		mv.addObject("dsBoard", dsBoard);

		mv.setViewName("/consulting/boardR");

		return mv;
	}

	@RequestMapping(value="/work/consulting/retrieveBoardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoardList(HttpServletRequest request, Model model, Criteria cri){
		ModelAndView mv = new ModelAndView();
		
		model.addAttribute("dsBoardList", consultingService.getListWithPaging(cri));
		
		int total = consultingService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		mv.setViewName("/consulting/boardListR");

		return mv;
	}

	@RequestMapping(value="/work/consulting/deleteBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String boardNo = request.getParameter("bno");

		boardParam.put("BNO", boardNo);

		consultingService.deleteBoard(boardParam);

		mv.setViewName("redirect:/work/consulting/retrieveBoardList.do");

		return mv;
	}

	@RequestMapping(value="/work/consulting/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBoard1(HttpServletRequest request, @ModelAttribute ConsultingBean board, Criteria cri, Model model){
		Map<String, String> boardParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String boardNo = request.getParameter("bno"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = board.getTitle();
        boardParam.put("BNO", boardNo);

        Map<String, String> dsBoard = consultingService.retrieveBoard(boardParam);

		if(flag == null){
			mv.addObject("dsBoard", dsBoard);
			mv.setViewName("/consulting/boardRegisterU");
		}else{
			consultingService.updateBoard(board);
			mv.setViewName("redirect:/work/consulting/retrieveBoard.do?bno=" + boardNo);
		}
		return mv;
	}

}
