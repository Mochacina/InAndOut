package com.ino.admin.dao;

import java.util.ArrayList;


import com.ino.admin.dto.AdminSalesDTO;

public interface AdminSalesDAO {

	int stotalCount();

	ArrayList<AdminSalesDTO> slist(int offset);

	boolean sblind(String sales_no);

	AdminSalesDTO shistory(String sales_no);

	int history_sblind(String sales_no);

}
