package com.datasnail.dao;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class UserStatisticDao extends JdbcDaoSupport{
	
	public JSONObject getrelationJsonResult(int start,int end,String[] nodeIds){
		JSONObject jsonResult = new JSONObject();
		
		String limitsql = "";
		String wheresql = " where 1=1";
		StringBuffer sb = new StringBuffer();
		if(nodeIds!=null&&nodeIds.length>0){
			for(String nodeId:nodeIds){
				sb.append(nodeId+",");
			}
			sb.delete(sb.length()-1,sb.length());
			wheresql += " and uid in ("+sb.toString()+")";
		}else{
			if(end!=-1){
				limitsql = " LIMIT "+start+","+end;
			}
		}
		
		
		String sql = "select uid,fid from afrelation11 "+wheresql+limitsql;
		List<Map<String,Object>> result = this.getJdbcTemplate().queryForList(sql);
		String usersql = "select distinct uid from ("+sql+") a union select distinct fid from ("+sql+") b";
		List<Map<String,Object>> userResult = this.getJdbcTemplate().queryForList(usersql);
		
		JSONArray json_legend = new JSONArray();
		json_legend.add("家人");
		json_legend.add("朋友");
		
		JSONArray json_cate = new JSONArray();
		JSONObject json_obj1 = new JSONObject();
		json_obj1.put("name", "家人");
		json_obj1.put("base", "Users");
		json_cate.add(json_obj1);
		JSONObject json_obj2 = new JSONObject();
		json_obj2.put("name", "朋友");
		json_obj2.put("base", "Users");
		json_cate.add(json_obj2);
		
		JSONArray json_nodes = new JSONArray();
		for(Map<String,Object> item:userResult){
			JSONObject json_obj = new JSONObject();
			json_obj.put("name", item.get("uid"));
			json_obj.put("value", 10);
			json_obj.put("category", 0);
			json_obj.put("draggable", true);
			json_nodes.add(json_obj);
		}
		
		
		JSONArray json_links = new JSONArray();
		for(Map<String,Object> item:result){
			JSONObject json_obj = new JSONObject();
			json_obj.put("source", item.get("uid")+"");
			json_obj.put("target", item.get("fid")+"");
			json_links.add(json_obj);
		}
		
		
		jsonResult.put("type", "force");
		jsonResult.put("legend", json_legend);
		jsonResult.put("categories", json_cate);
		jsonResult.put("nodes", json_nodes);
		jsonResult.put("links", json_links);
		
		return jsonResult;
	}


	public JSONObject getInteractionJsonResult(int start,int end,String[] nodeIds,String WeiboId){
		JSONObject jsonResult = new JSONObject();
		
		String limitsql = "";
		String wheresql = " where 1=1";
		wheresql += " and mblog_oid = \'"+WeiboId+"\'" ;
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
		
		
		String sql = "select mblog_id,mblog_pid from WeiboInfo "+wheresql+limitsql;
		List<Map<String,Object>> result = this.getJdbcTemplate().queryForList(sql);
		String usersql = "select distinct mblog_id from ("+sql+") a union select distinct mblog_pid from ("+sql+") b";
		List<Map<String,Object>> userResult = this.getJdbcTemplate().queryForList(usersql);
		
		JSONArray json_legend = new JSONArray();
		json_legend.add("家人");
		json_legend.add("朋友");
		
		JSONArray json_cate = new JSONArray();
		JSONObject json_obj1 = new JSONObject();
		json_obj1.put("name", "家人");
		json_obj1.put("base", "Users");
		json_cate.add(json_obj1);
		JSONObject json_obj2 = new JSONObject();
		json_obj2.put("name", "朋友");
		json_obj2.put("base", "Users");
		json_cate.add(json_obj2);
		
		JSONArray json_nodes = new JSONArray();
		for(Map<String,Object> item:userResult){
			JSONObject json_obj = new JSONObject();
			json_obj.put("name", item.get("mblog_id"));
			json_obj.put("value", 10);
			json_obj.put("category", 0);
			json_obj.put("draggable", true);
			json_nodes.add(json_obj);
		}
		
		
		JSONArray json_links = new JSONArray();
		for(Map<String,Object> item:result){
			JSONObject json_obj = new JSONObject();
			json_obj.put("source", item.get("mblog_pid")+"");
			json_obj.put("target", item.get("mblog_id")+"");
			json_links.add(json_obj);
		}
		
		
		jsonResult.put("type", "force");
		jsonResult.put("legend", json_legend);
		jsonResult.put("categories", json_cate);
		jsonResult.put("nodes", json_nodes);
		jsonResult.put("links", json_links);
		
		return jsonResult;
	}
	
	public JSONObject getUserLocation(int start,int end,String WeiboId){
		JSONObject jsonResult = new JSONObject();
		JSONArray jsonData = new JSONArray();
		int maxNum = -1;
		int count = 0;
		String limitsql = "";
		if(end!=-1){
			limitsql = " LIMIT "+start+","+end;
		}
		String sql = "SELECT loc,count(0) as num FROM (SELECT CASE WHEN usr_loc = \"其他\" THEN \"其他\" ELSE TRIM(SUBSTR(usr_loc,1,3)) END as loc from userinfo where usr_id in (SELECT usr_id from WeiboInfo where mblog_oid = \""+WeiboId+"\")"+limitsql+") a GROUP BY loc";
		List<Map<String,Object>> result = this.getJdbcTemplate().queryForList(sql);
		for(Map<String,Object> item : result){
			JSONObject jsonObj = new JSONObject();
			count  = Integer.parseInt(item.get("num")+"");
			maxNum = maxNum < count?count:maxNum;
			jsonObj.put("name", item.get("loc")+"");
			jsonObj.put("value", count);
			jsonData.add(jsonObj);
		}
		jsonResult.put("max", maxNum+maxNum/10);
		jsonResult.put("data", jsonData);
		return jsonResult;
	}
	
	public JSONObject crawlmes(){
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("mes", "正在处理不要急");
		return jsonResult;
	}
	
	public JSONObject extractmes(){
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("mes", "正在提取关键词");
		return jsonResult;
	}
	
	public JSONObject getGenderDistribution(String WeiboId){
		JSONObject jsonResult = new JSONObject();
		JSONArray jsonData = new JSONArray();
		String sql = "SELECT CASE WHEN usr_gender = \"m\" THEN \"男\" WHEN usr_gender = \"f\" THEN \"女\" ELSE \"其他\" END as gender,count(0) as count from UserInfo where usr_id in (SELECT usr_id from WeiboInfo where mblog_oid = \""+WeiboId+"\") GROUP BY usr_gender";
		List<Map<String,Object>> result = this.getJdbcTemplate().queryForList(sql);
		for(Map<String,Object> item : result){
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("value", item.get("count")+"");
			jsonObj.put("name", item.get("gender")+"");
			jsonData.add(jsonObj);
		}
		jsonResult.put("category", "['男','女','其他']");
		jsonResult.put("data", jsonData);
		return jsonResult;
	}

}
