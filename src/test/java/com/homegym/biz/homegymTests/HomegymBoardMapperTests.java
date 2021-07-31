//package com.homegym.biz.homegymTests;
//
//import java.util.HashMap;
//import java.util.List;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//
//import com.homegym.biz.homegym.Criteria;
//import com.homegym.biz.homegym.HomegymVO;
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//
//@WebAppConfiguration // 서블릿 컨텍스트를 이용하기 위함 
//@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
//					"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
//@Log4j
//public class HomegymBoardMapperTests {
//	
//	@Autowired
//	private SqlSessionTemplate mybatis;
//	
//	@Setter(onMethod_ = {@Autowired})
//	private WebApplicationContext ctx;
//	
//	private MockMvc mockMvc;
//	
//	@Before
//	public void setup() {
//		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
//	}
//	@Test
//	public void testGetList() {
//		
//		HomegymVO vo = new HomegymVO();
//		log.info("=================");
//		log.info(mybatis.selectList("HomegymDAO.getBoardList", vo));
//	}
//	
//	@Test
//	public void testPagingInHomegymBoard() {
//		
//		Criteria cri = new Criteria();
//		HomegymVO vo = new HomegymVO();
//		
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		params.put("vo", vo);
//		params.put("cri", cri);
//		
//		List<HomegymVO> list = mybatis.selectList("HomegymDAO.getBoardListWithPaging", params);
//		
//		list.forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testPagingController() throws Exception {
//		
//		log.info(mockMvc.perform(
//				MockMvcRequestBuilders.get("/homegym/hg_list.do")
//				.param("pageNum", "2")
//				.param("amount", "4"))
//				.andReturn().getModelAndView().getModelMap());
//	}
//}
