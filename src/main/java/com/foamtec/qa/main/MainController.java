package com.foamtec.qa.main;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by apichat on 8/18/2015 AD.
 */

@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping(value = "/dataJson", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> jsonDataTest() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            JSONArray jsonArray = new JSONArray();
            for(int i = 1; i<= 20; i++) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id",i);
                jsonObject.put("name","name" + i);
                jsonObject.put("price","price" + i);
                jsonObject.put("btn","<a href=\"\"><span class=\"glyphicon glyphicon-search\"></span></a>");
                jsonArray.put(jsonObject);
            }

            return new ResponseEntity<String>(jsonArray.toString(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
