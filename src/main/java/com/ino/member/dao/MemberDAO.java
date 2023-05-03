package com.ino.member.dao;

import java.util.ArrayList;
import java.util.HashMap;


import com.ino.member.dto.MemberDTO;



public interface MemberDAO {

	int overlay(String user_id);
	
	int overlay2(String nickname);

	int join(HashMap<String, String> params);

	int login(String id, String pw);

	ArrayList<MemberDTO> list();

	int delete(String id);

	HashMap<String, Object> detail(String user_id);

	
	

	int userRegist(HashMap<String, String> params);

	void fileWrite(String oriFileName, String newFileName, String user_id, String cate_no);

	int bizregist(String user_id, int biz_num, String biz, String store_name, String state);
	
	int riderbizregist(String user_id, int biz_num, String biz, String store_name,  String news, String nickname);

	
	
	void bizfileWrite(String oriFileName, String newFileName, String user_id, String cate_no);

	MemberDTO afterList(String user_id);

	int riderRegist(HashMap<String, String> params);

	void user_div(int user_div, String user_id, String user_div_name);

	

	

	

	


	

	

}
