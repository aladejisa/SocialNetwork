package com.datasnail.action;

import java.io.IOException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.datasnail.utils.louvain.ModularityOptimizer;
import com.opensymphony.xwork2.ActionSupport;

public class InfoAction extends ActionSupport {
	private JSONObject jsonResult;
	private String args;
	
	public String getArgs() {
		return args;
	}

	public void setArgs(String args) {
		this.args = args;
	}

	public JSONObject getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}


	public String getCommunityAPI() throws IOException{
        int [] result;
        String [] argsArr = args.split(",");
        String inputFileName = argsArr[0];//"H:\\myeclipse\\SocialNetwork\\src\\data\\arxiv.txt";
		jsonResult = new JSONObject();

		ModularityOptimizer mo = new ModularityOptimizer();
		result = mo.getCommunityResult(inputFileName);
		
		JSONObject groupid = new JSONObject();
		JSONArray groupIds = new JSONArray();
		
		for(int i = 0 ;i<result.length;i++){
			if(argsArr[1].equals(result[i]+"")){
				groupIds.add(i);
			}
		}

		jsonResult.put(argsArr[1],groupIds);
		
		return SUCCESS;
	}

}
