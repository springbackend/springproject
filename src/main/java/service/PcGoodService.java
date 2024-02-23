package service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.PcGoodDAO;
import vo.PcGoodVO;

public class PcGoodService {
	
	PcGoodDAO pcg_dao;
	
	public PcGoodService(PcGoodDAO pcg_dao) {
		this.pcg_dao = pcg_dao;
	}
	
	public int pcg_click(PcGoodVO pcg_vo) {
		int res = pcg_dao.good_Click(pcg_vo);
		return res;
	}
	
	public int pcg_u_idx(String u_id) {
		int u_idx =pcg_dao.good_user(u_id);
		return u_idx;
	}
//	public boolean userId_Check(String u_id) {
//		boolean check = false;
//		int u_idx = pcg_dao.user_check(u_id);//0
//		if(u_idx< 1) {
//			check = true;
//		}else {
//			pcg_dao.delete_pcg(u_idx);
//		}
//		return check;
//	}
	
	public boolean userId_Check(int u_idx,int pc_idx) {
		boolean check = false;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("u_idx", u_idx);
		map.put("pc_idx", pc_idx);
		PcGoodVO pcg_vo = pcg_dao.user_check(map);
		System.out.println(pcg_vo);
		if(pcg_vo == null) {
			check =true;
		}else {
			pcg_dao.delete_pcg(u_idx);
		}
		return check;
	}

}
