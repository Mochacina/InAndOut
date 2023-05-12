package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ino.admin.dao.GalleryDAO;
import com.ino.admin.dto.GalleryDTO;
import com.ino.admin.dto.MemberDTO;
import com.ino.admin.dto.StarDTO;

@Service
public class GalleryService {
	
	@Autowired GalleryDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());


	public HashMap<String, Object> list(HashMap<String, Object> params) {
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    		
		
	    total = dao.totalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<GalleryDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      list = dao.list(offset);
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
		
		
	}


}
