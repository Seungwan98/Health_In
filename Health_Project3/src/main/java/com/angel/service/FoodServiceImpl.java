package com.angel.service;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.angel.mapper.FoodMapper;
import com.angel.model.FoodVO;



@Service
public class FoodServiceImpl implements FoodService{
	
	@Autowired
	private FoodMapper mapper;

	@Override
	public void setDataBase() throws Exception {
		
		
			int check=0;
		
			List<FoodVO>list=new ArrayList<>();
		
			System.out.println("setDataBase");
			String url = "http://openapi.foodsafetykorea.go.kr/api/0953eeacbbde4438b716/I2790/xml/1/1000";
			DocumentBuilderFactory dbFactory=DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			
			Document doc= dBuilder.parse(url);
			doc.getDocumentElement().normalize();
			NodeList nList=doc.getElementsByTagName("row");
			System.out.println(nList.getLength());
			for(int i=0;i<nList.getLength();i++) {
				FoodVO vo;
				Node nNode=null;
				try {
					nNode=nList.item(i);
					Element eElement = (Element)nNode;
					
					String name=getTagValue("DESC_KOR",eElement);

					
					Float totalVolume=Float.parseFloat(getTagValue("SERVING_SIZE",eElement));
					
					Float kcal=Float.parseFloat(getTagValue("NUTR_CONT1",eElement));
					Float carbohydrate=Float.parseFloat(getTagValue("NUTR_CONT2",eElement));
					Float protein=Float.parseFloat(getTagValue("NUTR_CONT3",eElement));
					Float sugar=Float.parseFloat(getTagValue("NUTR_CONT4",eElement));
					Float natrium=Float.parseFloat(getTagValue("NUTR_CONT5",eElement));
					Float cholesterol=Float.parseFloat(getTagValue("NUTR_CONT6",eElement));
					Float fattyAcid=Float.parseFloat(getTagValue("NUTR_CONT7",eElement));
					Float transFattyAcid=Float.parseFloat(getTagValue("NUTR_CONT8",eElement));
					
					
					vo=new FoodVO();
					vo.setName(name);

					vo.setTotalVolume(totalVolume);
					vo.setKcal(kcal);
					vo.setCarbohydrate(carbohydrate);
					vo.setProtein(protein);
					vo.setSugar(sugar);
					vo.setNatrium(natrium);
					vo.setCholesterol(cholesterol);
					vo.setFattyAcid(fattyAcid);
					vo.setTransFattyAcid(transFattyAcid);
					
					
					System.out.println(vo);
				} catch (NullPointerException e) {
					System.out.println("error"+nNode);
					continue;
				}
				list.add(vo);
				
				
				check++;
			}
			System.out.println("check"+check);
			mapper.setDataBase(list);

		}
		 public static String getTagValue(String tag, Element eElement) {
		        NodeList nlList =  eElement.getElementsByTagName(tag).item(0).getChildNodes();
		        Node nValue = (Node) nlList.item(0);
		        if(nValue == null) {
		            return null;
		        }    
		        return nValue.getNodeValue();
		    }

}
