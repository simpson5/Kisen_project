package com.simpson.kisen.unofficial.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

/**
 * 비공식굿즈 컨트롤러
 */
@Controller
@RequestMapping("/unofficial")
@Slf4j
public class UnofficialController {
	@Autowired
	private ServletContext application;

	@Autowired
	private ResourceLoader resourceLoader;

	/**@ResponseBody
	@RequestMapping(value = "/image_upload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, String> update_file_upload(MultipartFile file, HttpServletRequest request) throws Exception {
		Map<String, String[]> paramMap = request.getParameterMap();
		Iterator keyData = paramMap.keySet().iterator();
		CommonData dto = new CommonData();
		while (keyData.hasNext()) {
			String key = ((String) keyData.next());
			String[] value = paramMap.get(key);
			dto.put(key, value[0].toString());
			smsp.print_String("key : " + key + ", value : " + value[0].toString());
		}
		MediaUtils MediaUtils = new MediaUtils();
		String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		BufferedImage resizeimg;
		if (mType != null) {
			BufferedImage srcImg = ImageIO.read(file.getInputStream());
			
			/*
			 * if(srcImg.getWidth()>1920) //사이즈 조절 할때 { smsp.print_String("사이즈 조절 1920");
			 * resizeimg = Scalr.resize(srcImg , Scalr.Method.QUALITY ,
			 * Scalr.Mode.FIT_TO_WIDTH , 1920 ,Scalr.OP_ANTIALIAS); ByteArrayOutputStream
			 * baos_re = new ByteArrayOutputStream(); boolean foundWriter_re =
			 * ImageIO.write(resizeimg, formatName.toLowerCase(), baos_re); baos_re.flush();
			 * byte[] imageInByte_re = baos_re.toByteArray();
			 * dto.put("mt_contentlength",baos_re.toByteArray().length); dto.put("mt_data",
			 * imageInByte_re); baos_re.close(); } else //사이즈 조절안할때.
			 */
			/**	{
				smsp.print_String("사이즈 조절안함. 1920");
				dto.put("mt_contentlength", file.getBytes().length);
				dto.put("mt_data", file.getBytes());
			}
			BufferedImage destImg = Scalr.resize(srcImg, Scalr.Method.BALANCED, 180, 180, Scalr.OP_ANTIALIAS);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			boolean foundWriter = ImageIO.write(destImg, "png", baos);
			baos.flush();
			byte[] imageInByte = baos.toByteArray();
			dto.put("mt_s_data", imageInByte);
			baos.close();
		}
		Map<String, String> result = new HashMap<>();
		result.put("result", "NOT_AN_IMAGE");
		if (mType != null) {
			dto.put("mt_filename", file.getOriginalFilename());
			dto.put("mt_type", file.getContentType());
			HttpSession session = request.getSession();
			Member vo = (Member) session.getAttribute("login");
			dto.put("mt_input_id", vo.idx);
			dto.put("mt_update_id", vo.idx);
			first_service.insert(dto, "File_UpDown_Mapper.insert_editor_image_upload");
			int idx = first_service.listSearchCount(dto, "File_UpDown_Mapper.select_editor_image_upload");
			result.put("result", "IMAGE_OK");
			String url = "/editor/get_editor_image/?idx=" + idx;
			String id = "" + idx;
			result.put("url", url);
			result.put("id", id);
		}
		return result;
	}
	**/

	@GetMapping("/unofficial.do")
	public void unofficial() {
	}

	@GetMapping("/demandForm.do")
	public void demandForm() {
	}

	@GetMapping("/depositForm.do")
	public void depositForm() {
	}

	@GetMapping("/depositDetail.do")
	public void depositDetail() {
	}

	@GetMapping("/demandDetail.do")
	public void demandDetail() {
	}

	@GetMapping("/demandFormlist.do")
	public void demandFormlist() {
	}

	@GetMapping("/depositFormlist.do")
	public void depositFormlist() {
	}

}
