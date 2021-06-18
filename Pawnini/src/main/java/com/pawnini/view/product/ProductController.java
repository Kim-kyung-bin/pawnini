package com.pawnini.view.product;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.pawnini.model.product.ProductDTO;
import com.pawnini.model.product.ProductService;
import com.pawnini.utils.UploadFileUtils;

@Controller
@SessionAttributes("product")
public class ProductController {

	@Autowired
	private ProductService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//관리자 상품등록 페이지 이동
	@RequestMapping(value="/goInsertProduct.do")
	public String goInsertProduct() {
		return "admin/product/insertProduct";
	}
	
	//상품등록 기능처리
	@RequestMapping(value="/insertProduct.do")
	public String insertProduct(ProductDTO dto, MultipartFile file) throws Exception{
		
		System.out.println("이미지 패스 설정 실행 전");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		System.out.println("이미지 패스 설정 실행 완료");
		
		service.insertProduct(dto);
		return "redirect:getProductList.do";
	}
	
	// 상품관리 리스트
	@RequestMapping(value="/getProductList.do")
	public String getProductList(ProductDTO dto, Model model) {
		model.addAttribute("productList", service.getProductList(dto));
		return "admin/product/getProductList";
	}
	// 상품 페이지 이동
	@RequestMapping(value="/goProductList.do")
	public String goProductList(ProductDTO dto, Model model) {
		model.addAttribute("productList", service.getProductList(dto));
		return "product/meal";
	}
	
	// 삭제
	@RequestMapping(value="/deleteProduct.do")
	public String deleteProduct(ProductDTO dto) {
		service.deleteProduct(dto);
		return "redirect:getProductList.do";
	}
	
	// 상품 업데이트 폼 이동
	@RequestMapping(value="/getProduct.do")
	public String getProduct(ProductDTO dto, Model model) throws Exception {
		model.addAttribute("product",service.getProduct(dto));
		return "admin/product/updateProduct";
	}
	// 상품 업데이트
	@RequestMapping(value="/updateProduct.do", method=RequestMethod.POST)
	public String updateProduct(ProductDTO dto, MultipartFile file, HttpServletRequest req) throws Exception {
		
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		// 기존 파일을 삭제
		new File(uploadPath + req.getParameter("product_img")).delete();
		new File(uploadPath + req.getParameter("product_thumb_img")).delete();
		
		// 새로 첨부한 파일을 등록
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				  
		dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				  
		} else {  // 새로운 파일이 등록되지 않았다면
		// 기존 이미지를 그대로 사용
		dto.setProduct_img(req.getParameter("product_img"));
		dto.setProduct_thumb_img(req.getParameter("product_thumb_img"));
		}
		
		service.updateProduct(dto);
		return "redirect:getProductList.do";
	}
	// 상품 업데이트
	@RequestMapping(value="/updateProduct.do", method=RequestMethod.GET)
	public String updateProduct(ProductDTO dto) {
		service.updateProduct(dto);
		return "redirect:getProductList.do";
	}
	// 상품 상세 페이지 이동
	@RequestMapping(value="/detailProduct.do")
	public String detailProduct(ProductDTO dto, Model model) throws Exception{
		// 조회수 처리
		service.productHits(dto);
		model.addAttribute("product", service.getProduct(dto));
		return "product/detail";
	}
}











