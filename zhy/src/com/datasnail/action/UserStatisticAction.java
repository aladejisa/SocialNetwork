package com.datasnail.action;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.io.*;
import com.datasnail.dao.UserStatisticDao;
import com.datasnail.filters.SpringInit;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;

public class UserStatisticAction extends ActionSupport {
	 

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nodeSize;
	private String nodeIds;
	private static String WeiboId;
	private UserStatisticDao usDao = (UserStatisticDao) SpringInit.getApplicationContext().getBean("usDao");
	private JSONObject jsonResult = new JSONObject();
	
	public JSONObject getJsonResult() {
		return jsonResult;
	}
	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}
	
	public String getNodeSize() {
		return nodeSize;
	}
	public void setNodeSize(String nodeSize) {
		this.nodeSize = nodeSize;
	}
	
	public String getWeiboId() {
		return WeiboId;
	}
	public void setWeiboId(String WeiboId) {
		UserStatisticAction.WeiboId = WeiboId;
	}
	
	public String getFollowTopoPage(){
		return SUCCESS;
	}
	public String getInteractionTopoPage(){
		
		return SUCCESS;
	}
	public String getStatisticPage(){
		
		return SUCCESS;
	}
	
	public String crawlAPI(){
		 try {  
				Runtime.getRuntime().exec("cmd /c start C:\\Users\\zhy\\Desktop\\MicroBlog\\test.bat "+this.getWeiboId()).waitFor();
				
			} catch (IOException | InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 jsonResult = usDao.crawlmes();
		 return SUCCESS;
		
	}
	
	public String extractAPI(){
		 try {  
				Runtime.getRuntime().exec("cmd /c start C:\\Users\\zhy\\Desktop\\MicroBlog\\test1.bat "+this.getWeiboId()).waitFor();
				
			} catch (IOException | InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 jsonResult = usDao.extractmes();
		 return SUCCESS;
		
	}
	
	public String getNodeIds() {
		return nodeIds;
	}
	public void setNodeIds(String nodeIds) {
		this.nodeIds = nodeIds;
	}
	public String followTopoAPI(){
		nodeSize = this.getNodeSize();
		nodeIds = this.getNodeIds();
		int end = -1;
		String[] nodeIdsArr = null;
		if(nodeIds!=null&&!nodeIds.equals("null")&&nodeIds.length()>0){
			nodeIdsArr = nodeIds.split(",");
		}
		if(nodeIdsArr==null&&nodeSize!=null){
			end = Integer.parseInt(nodeSize);
		}
		jsonResult = usDao.getrelationJsonResult(0, end,nodeIdsArr);
		return SUCCESS;
	}
	
	public String interactionTopoAPI(){
		nodeSize = this.getNodeSize();
		nodeIds = this.getNodeIds();
		WeiboId= this.getWeiboId();
		int end = -1;
		String[] nodeIdsArr = null;
		if(nodeIds!=null&&!nodeIds.equals("null")&&nodeIds.length()>0){
			nodeIdsArr = nodeIds.split(",");
		}
		if(nodeIdsArr==null&&nodeSize!=null){
			end = Integer.parseInt(nodeSize);
		}
		jsonResult = usDao.getInteractionJsonResult(0, end,nodeIdsArr,WeiboId);
		return SUCCESS;
	}
	
	public String getUserLocationDataAPI(){
		nodeSize = this.getNodeSize();
		WeiboId= this.getWeiboId();
		if(nodeSize.equals("all"))nodeSize = "-1";
		jsonResult = usDao.getUserLocation(1,Integer.parseInt(nodeSize),WeiboId);
		return SUCCESS;
	}
	
	public String getGenderDistributionAPI(){
		nodeSize = this.getNodeSize();
		WeiboId= this.getWeiboId();
		jsonResult = usDao.getGenderDistribution(WeiboId);
		return SUCCESS;
	}
	
	public String getKeywordAPI(){
		WeiboId= this.getWeiboId();;
		JSONArray jsonData = new JSONArray();
		String pathname = "C:\\Users\\zhy\\Desktop\\MicroBlog\\"+WeiboId+".txt";
		try (
			 FileReader reader = new FileReader(pathname);
	         BufferedReader br = new BufferedReader(reader)
		    ) 
		{
             String line;
             while ((line = br.readLine()) != null)
             {
            	JSONObject jsonObj = new JSONObject();
    			jsonObj.put("value", line.split(",")[1]+"");
    			jsonObj.put("name", line.split(",")[0]+"");
    			jsonData.add(jsonObj);
             }
		}catch (IOException e)
		{
            e.printStackTrace();
        }
		jsonResult.put("data", jsonData);
		return SUCCESS;
	}
	
	public String blogAnalyzePage(){
		return SUCCESS;
	}
	
}
