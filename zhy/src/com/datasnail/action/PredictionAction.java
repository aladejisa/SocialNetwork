package com.datasnail.action;

import net.sf.json.JSONObject;

import com.datasnail.dao.PredictionDao;
import com.datasnail.filters.SpringInit;
import com.opensymphony.xwork2.ActionSupport;

public class PredictionAction extends ActionSupport {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nodeSize;
	private String nodeIds;
	private JSONObject jsonResult = new JSONObject();
	private PredictionDao preDao = (PredictionDao) SpringInit.getApplicationContext().getBean("preDao");
	
	public String getNodeSize() {
		return nodeSize;
	}
	public void setNodeSize(String nodeSize) {
		this.nodeSize = nodeSize;
	}

	public JSONObject getJsonResult() {
		return jsonResult;
	}
	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}
	
	public String getNodeIds() {
		return nodeIds;
	}
	public void setNodeIds(String nodeIds) {
		this.nodeIds = nodeIds;
	}
	public String getStatisticPage(){
		
		return SUCCESS;
	}
	
	public String getPredictionResultAPI(){
		nodeSize = this.getNodeSize();
		nodeIds = this.getNodeIds();
		int end = -1;
		String[] nodeIdsArr = null;
		if(nodeIds!=null&&nodeIds.length()>0){
			nodeIdsArr = nodeIds.split(",");
		}
		if(nodeIdsArr==null&&nodeSize!=null){
			end = Integer.parseInt(nodeSize);
		}
		
		
		jsonResult = preDao.getUserbehaviorDistribute(0,end,nodeIdsArr);
		return SUCCESS;
	}
	
}
