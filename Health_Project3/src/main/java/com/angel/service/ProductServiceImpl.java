package com.angel.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.angel.mapper.CrawlingMapper;
import com.angel.mapper.ProductMapper;
import com.angel.model.Criteria;
import com.angel.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	private ProductVO vo;

	@Autowired
	private CrawlingMapper mapper;

	@Autowired
	private ProductMapper productMapper;

	private List<ProductVO> list;

	private int result;
	int count = 0;

	private Document getDocument(String url) {
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return doc;
	}

	@Override
	public int crwaling() {
		result = 0;
		list = new ArrayList<>();
//		String arr[] = { "https://www.monsterzym.com/vitamin/page-1/?items_per_page=96",
//				"https://www.monsterzym.com/vitamin/page-2/?items_per_page=96", "https://www.monsterzym.com/omega3/",
//				"https://www.monsterzym.com/prebiotics/", "https://www.monsterzym.com/magnesium-ko-2/",
//				"https://www.monsterzym.com/fresh/", "https://www.monsterzym.com/recovery/page-1/",
//				"https://www.monsterzym.com/recovery/page-2/", "https://www.monsterzym.com/supplements/page-1/",
//				"https://www.monsterzym.com/supplements/page-2/", "https://www.monsterzym.com/aminoacids/",
//				"https://www.monsterzym.com/creatine/", "https://www.monsterzym.com/arginine/",
//				"https://www.monsterzym.com/shaker/", "https://www.monsterzym.com/gear/",
//				"https://www.monsterzym.com/fashion/", "https://www.monsterzym.com/competition/",
//				"https://www.monsterzym.com/diet/", "https://www.monsterzym.com/hair-loss-care/" };

		String arr[] = { "https://www.monsterzym.com/vitamin/page-2/?items_per_page=12",
				"https://www.monsterzym.com/omega3/?items_per_page=12",
				"https://www.monsterzym.com/prebiotics/?items_per_page=12",
				"https://www.monsterzym.com/magnesium-ko-2/?items_per_page=12",
				"https://www.monsterzym.com/fresh/?items_per_page=12",
				"https://www.monsterzym.com/recovery/page-2/?items_per_page=96",
				"https://www.monsterzym.com/supplements/page-2/?items_per_page=12",
				"https://www.monsterzym.com/aminoacids/?items_per_page=12",
				"https://www.monsterzym.com/creatine/?items_per_page=12",
				"https://www.monsterzym.com/arginine/?items_per_page=12",
				"https://www.monsterzym.com/shaker/?items_per_page=12",
				"https://www.monsterzym.com/gear/?items_per_page=12",
				"https://www.monsterzym.com/fashion/?items_per_page=12",
				"https://www.monsterzym.com/competition/?items_per_page=12",
				"https://www.monsterzym.com/diet/?items_per_page=12",
				"https://www.monsterzym.com/hair-loss-care/?items_per_page=12" };

//		String arr2[] = { "비타민",
//
//				"비타민", "오메가3",
//
//				"식이섬유", "마그네슘", "닭가슴살", "단백질", "단백질", "부스터", "부스터", "아미노산", "크레아틴", "아르기닌", "쉐이커", "용품", "패션", "프로탄",
//				"다이어트", "탈모" };

		String arr2[] = { "vitamin", "omega3", "prebiotics", "magnesium-ko-2", "fresh", "recovery", "supplements",
				"aminoacid", "creatine", "arginine", "shaker", "gear", "fashion", "competition", "diet",
				"hair-loss-care" };

		for (int i = 0; i < arr2.length; i++) {
			Document doc = getDocument(arr[i]);
			String category = arr2[i];

			Elements es = doc.select(".grid-list.jq_product_list_grid");

			if (es != null) {

				for (Element e : es.select(".ty-column3")) {

					vo = new ProductVO();
					if (e.select(".ga-product-click").attr("data-ga-product-id") == "") {
						continue;
					}
					Long product_num = Long.parseLong(e.select(".ga-product-click").attr("data-ga-product-id"));
					// System.out.println(e.select(".ga-product-click").attr("data-ga-product-id"));
					String name = e.select(".product-title.ga-product-click").text();
					String img = e.select(".ty-pict").attr("src");
					String tagContent = e.select(".hash_tag_content").text();

					String countStr = e.select(".discussion_count_number").text();
					String detailPage = e.select(".ga-product-click").attr("href");

					countStr = countStr.replaceAll(",", "");
					Long count = (long) 0;
					if (!countStr.equals("")) {
						// System.out.println(countStr);
						count = Long.parseLong(countStr);
					}

					String price = e.select(".ty-price-num.jq_sec_price_item").text();
					String country = e.select(".product_country_text").text();
					String sale = e.select(".ty-list-price.ty-nowrap.jq_sec_price_item").text();

					// System.out.println(detailPage);
					String arr1[] = getdetailExplain(detailPage);
					// System.out.println(arr1);
					String detailExplain = arr1[0];
					String detailImage = arr1[1];

					// System.out.println("detail"+arr1[0]);

					vo.setCategory(category);
					vo.setCount(count);
					vo.setCountry(country);
					vo.setImg(img);
					vo.setName(name);
					vo.setPrice(price);
					vo.setProduct_num(product_num);
					vo.setDiscount(sale);
					vo.setTagContent(tagContent);

					vo.setDetailImage(detailImage);
					vo.setAmount(1000);

					if (detailExplain.length() >= 1000) {
						vo.setDetailExplain(detailExplain.substring(0, 1000));
						vo.setDetailExplain2(detailExplain.substring(1000));
						vo.setDetailExplain3("");

					} else {
						vo.setDetailExplain(detailExplain);
						vo.setDetailExplain2("");
						vo.setDetailExplain3("");
					}
					if (detailImage.length() >= 1000) {
						vo.setDetailImage(detailImage.substring(0, 1000));
						vo.setDetailImage2(detailImage.substring(1000));
					} else {
						vo.setDetailImage(detailImage);
						vo.setDetailImage2("");
					}
					result++;
					System.out.println(category + result);
					list.add(vo);
				}
			}

		}
		return mapper.insert(list);

	}

	public String[] getdetailExplain(String detailPage) {

		String arr[] = { null, null };
		String img = "";
		Document doc = getDocument(detailPage);

		Elements e1 = doc.select(".span16.ml-product-view-block");

		for (Element txt2 : e1.select("*img")) {

			img += txt2.attr("src") + "+";

		}

		String ex = "";
		Elements liTags = doc.select("div.storeMD").select("*li");
		for (Element li : liTags) {
			String num = li.select(".number").text();
			String ask = li.select(".txt1").text();
			String answer = li.select(".txt2").text();

			ex += "{" + num + "} {" + ask + "} {" + answer + "}";

			// System.out.println("ex"+ex);

		}

		arr[0] = ex;
		arr[1] = img;

		return arr;

	}

	@Override
	public List<ProductVO> select() {

		
		return productMapper.selectAll();

	}

	@Override
	public ProductVO selectOne(Long pno) {
		return productMapper.selectOne(pno);
	}

	@Override
	public List<ProductVO> getToCategory(String category) {

		return productMapper.getToCategory(category);
	}

	@Override
	public List<ProductVO> getToPaging(Criteria cri) {
		return productMapper.selectWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {

		return productMapper.getTotalCount(cri);

	}

}
