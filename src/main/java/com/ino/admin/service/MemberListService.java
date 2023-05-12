package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.MemberListDAO;
import com.ino.admin.dto.MemberDTO;
import com.ino.admin.dto.StarDTO;

@Service
public class MemberListService {
	
	@Autowired MemberListDAO dao;

	Logger logger  = LoggerFactory.getLogger(this.getClass());
	
	public HashMap<String, Object> list(HashMap<String, Object> params) {
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));
	    String userdiv = String.valueOf(params.get("userdiv"));
	    String userstate = String.valueOf(params.get("userstate"));
	    String userId = String.valueOf(params.get("userid"));
	    String search = String.valueOf(params.get("search"));
	    logger.info(page + "�� ���õ� ȸ���з���" + userdiv +"���� ������");
	    logger.info(page + "�� ���õ� ȸ�����°�" + userstate +"���� ������");
	    logger.info("���������� " + 5 +"���� ������ �� ");
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    
		
	    if(search.equals("default") || search.equals("")) {
	      if(userdiv.equals("default") && userstate.equals("default")) {
	      
	      // ��ü �����ֱ�
	      total = dao.totalCount();
	       
	      }else if(!(userdiv.equals("default")) && userstate.equals("default")){
	             
	      // ȸ�� �з��� ���õ� ���
	      total = dao.totalCountUserdiv(params);
	             
	       }else if(userdiv.equals("default") && !(userstate.equals("default"))){
	             
	      // ȸ�� ���¸� ���� �� ���
	      total = dao.totalCountUserstate(params);
	             
	       }else {
	        
	      // ȸ�� �з�, ȸ�� ���� �Ѵ� ���� �� ��� 
	      total = dao.totalCountAll(params);
	      }
	    
	    }else {	      
	    	   	   
	      // �˻���� �۵�
	      total = dao.totalCountSearch(search);
	       }
	       		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<MemberDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);
	      
	      
	      if(search.equals("default") ||search.equals("")) {
	        if(userdiv.equals("default") && userstate.equals("default")) {
	          // ��ü �����ֱ�
	          list = dao.list(offset);
	       
	        }else if(!(userdiv.equals("default")) && userstate.equals("default")) {
	          // ȸ�� �з��� ���� �� ��� 
	          list = dao.listUserdiv(params);
	        }
	         
	        else if(userdiv.equals("default") && !(userstate.equals("default"))){
	          // ȸ�� ���¸� ���� �� ���
	          list = dao.listUserstate(params);
	        
	        }else {
	          // ȸ�� �з�, ȸ�� ���� ��� ����
	          list = dao.listAll(params);
	         }
	     
	      }else {
	         // �˻� ���
	         list = dao.listSearch(params);
	      }
	      		
		
	      //logger.info("list size : "+ list.size());
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;
	   		
	
	}

	public MemberDTO viewdetail(String user_id) {
	
		return dao.viewdetail(user_id);
	}



	public ArrayList<MemberDTO> riderlist() {
		
		return dao.riderlist();
	}


	public MemberDTO riderdetail(String user_id) {
		
		return dao.riderdetail(user_id);
	}






	public int uhistorywrite(HashMap<String, String> params) {
		
		return dao.uhistorywrite(params);
	}


	public MemberDTO viewdetailextra(String user_id) {
		
		return dao.viewdetailextra(user_id);
	}

	public int history_userstate(HashMap<String, String> params, String user_id) {
		int result = dao.history_userstate(params);
		dao.userchange(user_id);
		return result;		
		
	}

	public MemberDTO riderdetailextra(String user_id) {
		
		
		return dao.riderdetailextra(user_id);
	}

	// ����ó�� �� �����丮 �ۼ�
	public int history_riderstate(HashMap<String, String> params,String user_id) {
		int result = dao.history_riderstate(params);
		dao.riderchange(user_id);
		return result;
	}
	
	// �ݷ�ó�� �� �����丮 �ۼ�
	public int history_riderstate2(HashMap<String, String> params, String user_id) {
		
		return dao.history_riderstate2(params);
	}


	public ArrayList<MemberDTO> userhistory(String user_id) {
		
		return dao.userhistory(user_id);
	}



	public MemberDTO uhistorydetail(String user_id, String user_state, String state_time) {
		
		return dao.uhistorydetail(user_id,user_state,state_time);
	}

	public HashMap<String, Object> riderlist(HashMap<String, Object> params) {
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    		
		
	    total = dao.rtotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<MemberDTO> riderlist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      riderlist = dao.riderlist(offset);
		
	      map.put("list", riderlist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;	
	}

	public HashMap<String, Object> authuserlist(HashMap<String, Object> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 5*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    		
		
	    total = dao.atotalCount();
		
	    int range = total%5  == 0 ? total/5 : total/5+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<MemberDTO> authuserlist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      authuserlist = dao.authuserlist(offset);
		
	      map.put("list", authuserlist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;
	}

	public int updateUserState(HashMap<String, String> params, String user_id, String radioValue) {
		int result = dao.updateUserState(params);
		dao.userStatechange(user_id,radioValue);
		return result; 
	}



	// ����ó�� �� �����丮 �ۼ� 









	




	}


