package com.spring.Hit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.Hit.dto.ZipcodeDto;
import com.spring.Hit.dto.ZipcodeSearchDto;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/zipcode")
public class ZipcodeController{
	
	private static final Logger logger = LoggerFactory.getLogger(ZipcodeController.class);
	
	public static final String ZIPCODE_API_KEY = "d61569e536dfc7f931474511543195";
    public static final String ZIPCODE_API_URL = "http://biz.epost.go.kr/KpostPortal/openapi"; // ��û URL
     
    /**
     * �����ȣ ȭ��
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/zipcodemain")
    public String zipcode() throws Exception {
         
        return "zipcode/zipcode";
    }
     
    /**
     * �����ȣ �˻� ���
     * @param searchTO
     * @return String
     * @throws Exception
     */
    
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
    public @ResponseBody String list(@ModelAttribute ZipcodeSearchDto searchDto) throws Exception {
         
        Map<String, Object> paramMap = new HashMap<String, Object>();
         
        // ��û URL ����
        StringBuilder queryUrl = new StringBuilder();
        queryUrl.append(ZIPCODE_API_URL);
        queryUrl.append("?regkey=");
        queryUrl.append(ZIPCODE_API_KEY);
        queryUrl.append("&target=");
        queryUrl.append(searchDto.getTarget());  // ���� ���� (����/���θ�, �������ȣ ����/���θ�)
        queryUrl.append("&query=");
        // ex) ������ 17 �� �Է��ϸ� �����ο� 17������ ��ĭ ������ ������ �߻��ϱ� ������ ��ĭ�� ���ش�.
        queryUrl.append(searchDto.getQuery().replaceAll(" ", ""));       // �˻���
        queryUrl.append("&countPerPage=");
        queryUrl.append(searchDto.getCountPerPage());
        Document document = Jsoup.connect(queryUrl.toString()).get();	
        //Jsoup�̶� html ������ �о���� �Ŀ� �� ������ dom��ü�� ��ȯ��.
        //jsoup�� select api�� �̿��ؼ� Ư�� element�� ������ �� �� �ְ�, �ش� element�� ������ �аų� ������ �� ����
        //*��ü�� api ��ȯ �޽����� xml �����̹Ƿ� �� element�� �����ؼ� ���� �ҷ��� �� �ִ�.
         
        String errorCode = document.select("error_code").text();	//�����ڵ� �˻�
         
        // ��û ����� ������ ��� ������ �Ľ��Ͽ� List �� ��´�.
        if (null == errorCode || "".equals(errorCode)) {
        	Elements pageinfo = document.select("pageinfo");	//������ ���� Elements
        	//totalcount:��üitem���� , totalpage:���������� , countperpage:��������item���� , currentpage:������������ȣ
        	//System.out.println(document.select("pageinfo"));
        	
            Elements elements = document.select("item");		//�ּҰ� ���� Elements
     //     System.out.println(document.select("item"));
          
            List<ZipcodeDto> list = new ArrayList<ZipcodeDto>();
            ZipcodeDto zipcodeDto = null;
            
            String totalCount = pageinfo.select("totalcount").text();
            String totalPage = pageinfo.select("totalpage").text();
            String countperpage = pageinfo.select("countperpage").text();
            String currentpage = pageinfo.select("currentpage").text();
            
            for (Element element : elements) {
            	zipcodeDto = new ZipcodeDto();
                
                if(element.select("postcd").text().equals("null")){
                	zipcodeDto.setZipcode("-");
                }else{
                	zipcodeDto.setZipcode(element.select("postcd").text());
                }
                //postcd�� �����ȣ ���̴�.
       //         System.out.println(element.select("postcd").text());	//�����ȣ ���
                
                	
                // ���θ� �˻��� ��� (target�� Road�� �����ϸ�)
                if (searchDto.getTarget().indexOf("Road") > -1) {
                	zipcodeDto.setAddress(element.select("rnaddress").text());//���θ� �ּ�
                	zipcodeDto.setLnmAddress(element.select("lnmaddress").text());//���� �ּ�
                     
                // ���� �˻��� ���
                } else {
                	zipcodeDto.setAddress(element.select("address").text());
                }
                 
                list.add(zipcodeDto);
            }
            
            paramMap.put("list", list);
            //list��� �̸����� �ּҰ��� paramMap�� ����. 
            // ��û ����� ������ �ƴ� ��� ���� ������ ��´�.
            paramMap.put("totalCount", totalCount); //��ü ����
            paramMap.put("totalPage", totalPage);	//������ ����
            paramMap.put("countperpage", countperpage);//�������� item����
            paramMap.put("currentpage", currentpage);	//���� ������ ��
        } else {
            String errorMessage = document.select("message").text();
             
            paramMap.put("errorCode", errorCode);
            paramMap.put("errorMessage", errorMessage);
        }
 //       System.out.println((new Gson()).toJson(paramMap));
        return (new Gson()).toJson(paramMap);
    }
	
}
