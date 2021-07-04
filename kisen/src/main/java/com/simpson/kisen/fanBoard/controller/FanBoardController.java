package com.simpson.kisen.fanBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.social.google.api.plus.moments.Artist;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.artist.model.service.ArtistService;
import com.simpson.kisen.common.util.HelloSpringUtils;
import com.simpson.kisen.fan.model.vo.Authority;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.fanBoard.model.service.FanBoardService;
import com.simpson.kisen.fanBoard.model.vo.FanBoard;
import com.simpson.kisen.fanBoard.model.vo.FanBoardExt;
import com.simpson.kisen.fanBoard.model.vo.FanBoardLike;
import com.simpson.kisen.fanBoard.model.vo.FbAttachment;
import com.simpson.kisen.fanBoard.model.vo.FbComment;
import com.simpson.kisen.idol.model.vo.Idol;

import jline.internal.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/fanBoard")
@SessionAttributes("fanBoard")
public class FanBoardController {

	// 절대경로를 가져오기 위한 의존주입
	@Autowired
	private ServletContext application;

	private ServletContext context;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private FanBoardService fanBoardService;

	@Autowired
	private ArtistService artistService;

	@GetMapping("/fanBoardEnroll.do")
	public void fanBoardEnroll(Authentication authentication, Model model, @RequestParam int idolNo) {
		Fan principal = (Fan) authentication.getPrincipal();
		String idolName = fanBoardService.selectOneIdolName(idolNo);
		List<Idol> idolList = artistService.selectAllIdolName();
		model.addAttribute("idolList", idolList);
		model.addAttribute("idolName", idolName);
		model.addAttribute("loginMember", principal);
	}

	@PostMapping("/fanBoardEnroll.do")
	public String fanBoardEnroll(@ModelAttribute FanBoardExt fanBoard,
			@RequestParam(name = "upFile") MultipartFile[] upFiles, Model model) throws Exception {
		log.info("board = {}", fanBoard);
		try {
			// 1. 서버 컴퓨터에 파일 저장
			String saveDirectory = application.getRealPath("resources/upload/fanBoard");
			log.info("saveDirectory = {}", saveDirectory);

			// 디렉토리 생성
			File dir = new File(saveDirectory);
			if (!dir.exists())
				dir.mkdirs();

			// 복수개의 attachment를 list로 관리
			List<FbAttachment> fbAttachList = new ArrayList<>();

			// 파일을 경로에 저장
			for (MultipartFile upFile : upFiles) {
				// input[name=upFile]로부터 비어있는 upFile이 넘어온다. (파일 선택을 안해도 null이 아님)
				if (upFile.isEmpty())
					continue; // continue를 통해 이하코드 진행되지 않도록

				// 파일명 변경
				String renamedFilename = HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename());

				// a. 서버컴퓨터에 저장
				// file 객체 생성(부모디렉토리, 파일명)
				File dest = new File(saveDirectory, renamedFilename);
				upFile.transferTo(dest); // 파일 이동 // 예외 던짐

				// b. 저장된 데이터를 Attachment객체에 저장 및 list에 추가
				FbAttachment fbAttach = new FbAttachment();
				fbAttach.setOriginalFilename(upFile.getOriginalFilename());
				fbAttach.setRenamedFilename(renamedFilename);
				// attachList에 차곡차곡 담기
				fbAttachList.add(fbAttach);
			}
			log.info("fbAttachList = {}", fbAttachList);

			// 2. 업무로직 : db저장 (board, attach테이블 모두 insert)
			fanBoard.setAttachList(fbAttachList);
			int result = fanBoardService.insertFanBoard(fanBoard);

			log.info("fanBoard.fbNo = {}", fanBoard.getFbNo());

		} catch (Exception e) {
			log.error("게시글 등록 오류!", e);
			throw e;
		}
		return "redirect:/fanBoard/fanBoardDetail.do?no=" + fanBoard.getFbNo();
	}

	@GetMapping("/fanBoardList/{idolNo}")
	public ResponseEntity<?> fanBoardList(@PathVariable int idolNo,
			@RequestParam(required = true, defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		try {
			log.info("idolNo= {}", idolNo);
			log.debug("cPage = {}", cPage);
			final int limit = 10;
			final int offset = (cPage - 1) * limit;
			log.info("idolNo = {}", idolNo);

			Map<String, Object> param = new HashMap<>();
			param.put("idolNo", idolNo);
			param.put("limit", limit);
			param.put("offset", offset);
			// 1. 업무로직 : content영역 - Rowbounds
			List<FanBoard> list = fanBoardService.selectFanBoardList(param);
			log.info("fanBoardList = {}", list);

			// pageBar 가져오기
			// 전체페이지수, 현재페이지, 한페이지당 게시글 수, 이동할 url
			int totalContents = fanBoardService.selectFanBoardTotalContents(idolNo);
			String url = request.getContextPath(); // 현재 요청페이지
			log.debug("totalContents = {}, url = {}", totalContents, url);
			// totalContents = 60, url = /spring/board/boardList.do

			String pageBar = HelloSpringUtils.getFbPageBar(totalContents, cPage, limit, url, idolNo);

			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("pageBar", pageBar);

			return ResponseEntity.ok().body(map);
		} catch (Exception e) {
			log.error("게시글 조회 오류!", e);
			throw e;
		}
	}

	@GetMapping("/fanBoardListWithArtistInfo.do")
	public void fanBoardListWithArtistInfo() {
	}

	@GetMapping("/fanBoardDetail.do")
	public void selectOneBoard(Authentication authentication, @RequestParam int no,
			@RequestParam(required = true, defaultValue = "1") int cPage, HttpServletRequest request, Model model) {
		try {
			Fan principal = null;
			try {
				principal = (Fan) authentication.getPrincipal();
			} catch (Exception e) {
			}

			FanBoardExt fanBoard = null;
			fanBoard = fanBoardService.selectOneFanBoardCollection(no);
			model.addAttribute("fanBoard", fanBoard);

			// 게시글의 아이돌이름 가져오기
			int idolNo = fanBoardService.selectOneIdolNo(no);
			String idolName = fanBoardService.selectOneIdolName(idolNo);

			// 댓글 가져오기
			List<FbComment> commentList = fanBoardService.selectFbCommentList(no);
			int commentCnt = commentList.size();
			log.info("commentList = {}", commentList);
			log.info("commentCnt = {}", commentCnt);

			// 리스트 가져오기
			final int limit = 5;
			final int offset = (cPage - 1) * limit;
			Map<String, Object> param = new HashMap<>();
			param.put("idolNo", idolNo);
			param.put("limit", limit);
			param.put("offset", offset);
			List<FanBoard> list = fanBoardService.selectFanBoardList(param);

			// pageBar 가져오기
			// 전체페이지수, 현재페이지, 한페이지당 게시글 수, 이동할 url
			int totalContents = fanBoardService.selectFanBoardTotalContents(idolNo);
			String url = request.getContextPath(); // 현재 요청페이지
			log.debug("totalContents = {}, url = {}", totalContents, url);
			// totalContents = 60, url = /spring/board/boardList.do

			String pageBar = HelloSpringUtils.getFbDetailPageBar(totalContents, cPage, limit, url, no);

			// 2. jsp에 위임
			model.addAttribute("idolName", idolName);
			model.addAttribute("commentList", commentList);
			model.addAttribute("fbList", list);
			model.addAttribute("pageBar", pageBar);
			model.addAttribute("commentCnt", commentCnt);
			if (principal != null) {
				model.addAttribute("loginMember", principal);
			}
		} catch (Exception e) {
			log.error("게시글 조회 오류!", e);
			throw e;
		}
	}

	// 파일 다운로드
	@GetMapping("/fileDownload.do")
	public ResponseEntity<Resource> fileDownloadWithResponseEntity(@RequestParam int no)
			throws UnsupportedEncodingException {
		ResponseEntity<Resource> responseEntity = null;
		try {
			// 1. 업무로직 : db조회
			FbAttachment attach = fanBoardService.selectOneFbAttachment(no);
			if (attach == null) {
				return ResponseEntity.notFound().build();
			}
			// 2. Resource객체
			String saveDirectory = application.getRealPath("/resources/upload/fanBoard");
			// 다운로드 받을 파일
			File downFile = new File(saveDirectory, attach.getRenamedFilename());
			Resource resource = resourceLoader.getResource("file:" + downFile);
			// attach의 originalfilename을 가져와서 byte배열로 만든 후 다시 인코딩 변환
			String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1"); // throws
																										// UnsupportedEncodingException
			// 3. Response Entity객체 생성 및 리턴
			responseEntity = ResponseEntity.ok() // status code를 200번으로 설정
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + filename).body(resource);
		} catch (Exception e) {
			log.error("파일 다운로드 오류", e);
			throw e;
		}
		return responseEntity;
	}

	@ResponseBody
	@PostMapping("/fbComment")
	public Map<String, Object> insertfbComment(@RequestBody FbComment fbComment) {
		try {
			log.debug("fbComment = {}", fbComment);

			int result = fanBoardService.insertfbComment(fbComment);
			Map<String, Object> map = new HashMap<>();
			map.put("msg", "댓글을 등록하였습니다.");
			return map;
		} catch (Exception e) {
			log.error("댓글 등록에 실패하였습니다.");
			throw e;
		}
	}

	@GetMapping("/fanBoardUpdate.do")
	public void fanBoardUpdate(@RequestParam int fbNo, Model model) {
		List<Idol> idolList = artistService.selectAllIdolName();
		model.addAttribute("idolList", idolList);

		FanBoardExt fanBoard = fanBoardService.selectOneFanBoardCollection(fbNo);
		int idolNo = fanBoardService.selectOneIdolNo(fbNo);
		String idolName = fanBoardService.selectOneIdolName(idolNo);
		log.debug("update - fanBoard = {}", fanBoard);
		model.addAttribute("fanBoard", fanBoard);
		model.addAttribute("idolName", idolName);
	}

	@DeleteMapping("/fanBoardDelete/{fbNo}")
	public ResponseEntity<?> deleteFanBoard(@PathVariable int fbNo) {
		try {
			int result = fanBoardService.deleteFanBoard(fbNo);
			if (result > 0) {
				Map<String, Object> map = new HashMap<>();
				map.put("msg", "게시글을 삭제하였습니다.");
				return new ResponseEntity<>(map, HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND); // 404를 넘김
			}
		} catch (Exception e) {
			log.error("게시글 수정에 실패했습니다.", e);
			throw e;
		}
	}

	@GetMapping("/fanBoardIdolName")
	public ResponseEntity<?> fanBoardIdolName(@RequestParam int idolNo, Model model) {
		try {

			String idolName = fanBoardService.selectOneIdolName(idolNo);

			Map<String, Object> map = new HashMap<>();
			map.put("idolName", idolName);

			return ResponseEntity.ok().body(map);
		} catch (Exception e) {
			log.error("아이돌이름 조회 오류!", e);
			throw e;
		}
	}

	@ResponseBody
	@PostMapping("/fbReply")
	public Map<String, Object> insertfbReply(

			@RequestBody FbComment fbReply) {
		try {
			log.debug("fbComment = {}", fbReply);
			int result = fanBoardService.insertfbReply(fbReply);
			Map<String, Object> map = new HashMap<>();
			map.put("msg", "댓글을 등록하였습니다.");

			return map;
		} catch (Exception e) {
			log.error("댓글 등록에 실패하였습니다.");
			throw e;
		}
	}

	@GetMapping("/searchKeyword.do")
	@ResponseBody
	public Map<String, Object> searchKeyword(@RequestParam String searchKeyword) {
		log.debug("searchTitle = {}", searchKeyword);

		// 1. 업무로직 : 검색어로 board 조회
		// 해당 검색어에 대해 여러건의 결과가 넘어오므로 list
		List<FanBoard> list = fanBoardService.searchKeyword(searchKeyword);
		log.debug("list = {}", list);

		// 2. map에 검색결과를 담아서 전송
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("searchKeyword", searchKeyword);
		return map;
	}

	@DeleteMapping("/fbCommentDelete/{commentNo}")
	public ResponseEntity<?> deleteFbComment(@PathVariable int commentNo) {
		try {
			int result = fanBoardService.deleteFbComment(commentNo);
			if (result > 0) {
				Map<String, Object> map = new HashMap<>();
				map.put("msg", "댓글을 삭제하였습니다.");
				return new ResponseEntity<>(map, HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND); // 404를 넘김
			}
		} catch (Exception e) {
			log.error("댓글을 삭제하였습니다.", e);
			throw e;
		}
	}

	@PutMapping("/updateFbReadCnt/{fbNo}")
	public ResponseEntity<?> updateFbReadCnt(@PathVariable int fbNo) {
		try {
			int result = fanBoardService.updateFbReadCnt(fbNo);
			if (result > 0) {
				int readCnt = fanBoardService.selectOneReadCnt(fbNo);

				Map<String, Object> map = new HashMap<>();
				map.put("msg", "조회수를 1 증가하였습니다.");
				map.put("readCnt", readCnt);
				log.info("readCnt = {}", readCnt);
				return new ResponseEntity<>(map, HttpStatus.OK);

			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND); // 404를 넘김
			}
		} catch (Exception e) {
			log.error("조회수 증가에 실패하였습니다.", e);
			throw e;
		}
	}

	@PostMapping("/fanBoardUpdate.do")
	public String fanBoardUpdate(@ModelAttribute FanBoardExt fanBoard,
			@RequestParam(name = "upFile") MultipartFile[] upFiles,
			@RequestParam(name = "delFile", required = false) String[] attachNoes, RedirectAttributes redirectAttr,
			Model model) throws Exception {
		try {
			log.info("board = {}", fanBoard);

			// 1. 서버 컴퓨터에 파일 저장
			String saveDirectory = application.getRealPath("resources/upload/fanBoard");
			log.info("saveDirectory = {}", saveDirectory);

			// 디렉토리 생성
			File dir = new File(saveDirectory);
			if (!dir.exists())
				dir.mkdirs();

			// 복수개의 attachment를 list로 관리
			List<FbAttachment> fbAttachList = new ArrayList<>();

			// 파일을 경로에 저장
			for (MultipartFile upFile : upFiles) {
				// input[name=upFile]로부터 비어있는 upFile이 넘어온다. (파일 선택을 안해도 null이 아님)
				if (upFile.isEmpty())
					continue; // continue를 통해 이하코드 진행되지 않도록

				// 파일명 변경
				String renamedFilename = HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename());

				// a. 서버컴퓨터에 저장
				// file 객체 생성(부모디렉토리, 파일명)
				File dest = new File(saveDirectory, renamedFilename);
				upFile.transferTo(dest); // 파일 이동 // 예외 던짐

				// b. 저장된 데이터를 Attachment객체에 저장 및 list에 추가
				FbAttachment fbAttach = new FbAttachment();
				fbAttach.setOriginalFilename(upFile.getOriginalFilename());
				fbAttach.setRenamedFilename(renamedFilename);
				// attachList에 차곡차곡 담기
				fbAttachList.add(fbAttach);
			}
			log.info("fbAttachList = {}", fbAttachList);

			// 2. 업무로직 : db저장 (board, attach테이블 모두 insert)
			fanBoard.setAttachList(fbAttachList);
			int result = fanBoardService.updateFanBoard(fanBoard, attachNoes);

		} catch (Exception e) {
			log.error("게시글 수정에 실패했습니다.", e);
			throw e;
		}
		return "redirect:/fanBoard/fanBoardDetail.do?no=" + fanBoard.getFbNo();
	}
	
	@PostMapping("/fanBoardLikeAdd.do")
	public ResponseEntity<?> updateFanBoardLikeAdd (
					@RequestParam int fbNo, @RequestParam String fanId) {
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("fanId", fanId);
			param.put("fbNo", fbNo);
			log.info("fanId = {}", fanId);
			
			Map<String, Object> map = new HashMap<>();
			int result = fanBoardService.updateFbLikeAdd(param);
			if (result == 1) {
				map.put("msg", "좋아요를 1 증가 하였습니다.");
				return new ResponseEntity<>(map, HttpStatus.OK);
			} 
			if (result == -1) {
				map.put("msg", "이미 좋아요를 누르셨습니다.");
				return new ResponseEntity<>(map, HttpStatus.OK);
			}
			else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND); // 404를 넘김
			}
		} catch (Exception e) {
			log.error("좋아요 증가에 실패하였습니다.", e);
			throw e;
		}
	}
}
