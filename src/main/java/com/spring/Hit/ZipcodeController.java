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
public class ZipcodeController{
	
	private static final Logger logger = LoggerFactory.getLogger(ZipcodeController.class);
	
	public static final String ZIPCODE_API_KEY = "d61569e536dfc7f931474511543195";
    public static final String ZIPCODE_API_URL = "http://biz.epost.go.kr/KpostPortal/openapi"; // 요청 URL
     
    /**
     * 우편번호 화면
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/zipcode")
    public String zipcode() throws Exception {
         
        return "zipcode/zipcode";
    }
     
    /**
     * 우편번호 검색 결과
     * @param searchTO
     * @return String
     * @throws Exception
     */
    
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
    public @ResponseBody String list(@ModelAttribute ZipcodeSearchDto searchDto) throws Exception {
         
        Map<String, Object> paramMap = new HashMap<String, Object>();
         
        // 요청 URL 생성
        StringBuilder queryUrl = new StringBuilder();
        queryUrl.append(ZIPCODE_API_URL);
        queryUrl.append("?regkey=");
        queryUrl.append(ZIPCODE_API_KEY);
        queryUrl.append("&target=");
        queryUrl.append(searchDto.getTarget());  // 서비스 종류 (지번/도로명, 새우편번호 지번/도로명)
        queryUrl.append("&query=");
        // ex) 세종로 17 로 입력하면 세종로와 17사이의 빈칸 때문에 에러가 발생하기 때문에 빈칸을 없앤다.
        queryUrl.append(searchDto.getQuery().replaceAll(" ", ""));       // 검색어
        queryUrl.append("&countPerPage=");
        queryUrl.append(searchDto.getCountPerPage());
        Document document = Jsoup.connect(queryUrl.toString()).get();	
        //Jsoup이란 html 문서를 읽어들인 후에 그 문서를 dom객체로 변환함.
        //jsoup의 selector api를 이용해서 특정 element에 접근을 할 수 있고, 해당 element의 정보를 읽거나 수정할 수 있음
        //*우체국 api 반환 메시지가 xml 형식이므로 각 element에 접근해서 값을 불러올 수 있다.
         
        String errorCode = document.select("error_code").text();	//에러코드 검색
         
        // 요청 결과가 정상일 경우 내용을 파싱하여 List 에 담는다.
        if (null == errorCode || "".equals(errorCode)) {
        	Elements pageinfo = document.select("pageinfo");	//페이지 정보 Elements
        	//totalcount:전체item갯수 , totalpage:페이지갯수 , countperpage:페이지에item갯수 , currentpage:현재페이지번호
        	//System.out.println(document.select("pageinfo"));
        	
            Elements elements = document.select("item");		//주소값 정보 Elements
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
                //postcd는 우편번호 값이다.
       //         System.out.println(element.select("postcd").text());	//우편번호 출력
                
                	
                // 도로명 검색일 경우 (target에 Road가 존재하면)
                if (searchDto.getTarget().indexOf("Road") > -1) {
                	zipcodeDto.setAddress(element.select("rnaddress").text());//도로명 주소
                	zipcodeDto.setLnmAddress(element.select("lnmaddress").text());//지번 주소
                     
                    // 지번 검색일 경우
                } else {
                	zipcodeDto.setAddress(element.select("address").text());
                }
                 
                list.add(zipcodeDto);
            }
            
            paramMap.put("list", list);
            //list라는 이름으로 주소값들 paramMap에 저장. 
            // 요청 결과가 정상이 아닐 경우 에러 내용을 담는다.
            paramMap.put("totalCount", totalCount); //전체 갯수
            paramMap.put("totalPage", totalPage);	//페이지 갯수
            paramMap.put("countperpage", countperpage);//페이지에 item갯수
            paramMap.put("currentpage", currentpage);	//현재 페이지 수
        } else {
            String errorMessage = document.select("message").text();
             
            paramMap.put("errorCode", errorCode);
            paramMap.put("errorMessage", errorMessage);
        }
        System.out.println((new Gson()).toJson(paramMap));
        return (new Gson()).toJson(paramMap);
    }
	
}
