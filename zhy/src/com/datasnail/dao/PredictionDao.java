package com.datasnail.dao;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.jdbc.core.support.JdbcDaoSupport;


public class PredictionDao extends JdbcDaoSupport{


	
	public JSONObject getUserbehaviorDistribute(int start, int end,String[] nodeIds)
	{
		JSONObject jsonResult = new JSONObject();
		JSONArray userJsonArr = new JSONArray();
		JSONArray jsonUserData = new JSONArray();
		JSONArray dataJsonArrGZ = new JSONArray();
		JSONArray dataJsonArrJH = new JSONArray();
		JSONArray dataJsonArrZS = new JSONArray();
		
		String limitsql = "";
		String wheresql = " where 1=1";
		StringBuffer sb = new StringBuffer();
		if(nodeIds!=null&&nodeIds.length>0){
			for(String nodeId:nodeIds){
				sb.append(nodeId+",");
			}
			sb.delete(sb.length()-1,sb.length());
			wheresql += " and id in ("+sb.toString()+")";
		}else{
			if(end!=-1){
				limitsql = " LIMIT "+start+","+end;
			}
		}
		String sql = "SELECT id,resultjh,resultgz,resultzs from gephiusersfeature "+wheresql+limitsql;
		
		List<Map<String,Object>> resultLs = this.getJdbcTemplate().queryForList(sql);
		double total;
		for(Map<String,Object> item:resultLs){
			userJsonArr.add(item.get("id")+"");
			total = Double.parseDouble(item.get("resultgz")+"")+Double.parseDouble(item.get("resultjh")+"")+Double.parseDouble(item.get("resultzs")+"");
			dataJsonArrGZ.add(Double.parseDouble(item.get("resultgz")+"")/total);
			dataJsonArrJH.add(Double.parseDouble(item.get("resultjh")+"")/total);
			dataJsonArrZS.add(Double.parseDouble(item.get("resultzs")+"")/total);
			
		}
		JSONObject jsonobjGZ = new JSONObject();
		jsonobjGZ.put("name", "关注群体");
		jsonobjGZ.put("type", "line");
		jsonobjGZ.put("areaStyle", "{\"normal\":{}}");
		jsonobjGZ.put("data", dataJsonArrGZ);
		
		JSONObject jsonobjJH = new JSONObject();
		jsonobjJH.put("name", "交互群体");
		jsonobjJH.put("type", "line");
		jsonobjJH.put("areaStyle", "{\"normal\":{}}");
		jsonobjJH.put("data", dataJsonArrJH);
		
		JSONObject jsonobjZS = new JSONObject();
		jsonobjZS.put("name", "用户自身");
		jsonobjZS.put("type", "line");
		jsonobjZS.put("areaStyle", "{\"normal\":{}}");
		jsonobjZS.put("data", dataJsonArrZS);
		
		jsonUserData.add(jsonobjGZ);
		jsonUserData.add(jsonobjJH);
		jsonUserData.add(jsonobjZS);
		
		jsonResult.put("users", userJsonArr);
		jsonResult.put("usersdata", jsonUserData);
		return jsonResult;
	}
}
