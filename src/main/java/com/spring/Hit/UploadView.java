package com.spring.Hit;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.Hit.dto.ProductDto;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

public class UploadView {

	public List<List<ProductDto>> upload(MultipartHttpServletRequest mReq) {

		String uploadPath = "C:\\uploadExcelFile\\";

		File dir = new File(uploadPath);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		Iterator<String> iter = mReq.getFileNames();
		List<List<ProductDto>> list = new ArrayList<List<ProductDto>>();
		List<ProductDto> pdList = new ArrayList<ProductDto>();
		List<ProductDto> new_pdList = new ArrayList<ProductDto>();

		while (iter.hasNext()) {

			String uploadFileName = iter.next();
			MultipartFile mFile = mReq.getFile(uploadFileName);
			String fileName = mFile.getOriginalFilename();

			if (fileName != null && !fileName.equals("")) {
				File file = null;
				file = new File(uploadPath + fileName);

				try {
					mFile.transferTo(file);

					// Excel파일 읽기
					ProductDto pd = null;
					Workbook book = Workbook.getWorkbook(file);

					Sheet sheet = book.getSheet(0);
					Sheet sheet2 = book.getSheet(1);

					int rowCount = sheet.getRows();
					int rowCount2 = sheet2.getRows();

					if (rowCount != 0) {
						for (int row = 1; row < rowCount; row++) {
							pd = new ProductDto();

							Cell c1 = sheet.getCell(0, row);
							Cell c2 = sheet.getCell(1, row);

							String item_no = c1.getContents();
							String volume = c2.getContents();

							pd.setItem_no(Integer.parseInt(item_no));
							pd.setVolume(Integer.parseInt(volume));
							System.out.println(item_no + " /// " + volume);
							pdList.add(pd);
						}
					}
					if (rowCount2 != 0) {
						for (int row = 1; row < rowCount2; row++) {
							pd = new ProductDto();

							Cell c1 = sheet2.getCell(0, row);
							Cell c2 = sheet2.getCell(1, row);
							Cell c3 = sheet2.getCell(2, row);
							Cell c4 = sheet2.getCell(3, row);
							Cell c5 = sheet2.getCell(4, row);
							Cell c6 = sheet2.getCell(5, row);

							String item_name = c1.getContents();
							String category = c2.getContents();
							String price = c3.getContents();
							String volume = c4.getContents();
							String img = c5.getContents();
							String item_content = c6.getContents();

							pd.setItem_name(item_name);
							pd.setCategory(category);
							pd.setPrice(Integer.parseInt(price));
							pd.setVolume(Integer.parseInt(volume));
							pd.setImg(img);
							pd.setItem_content(item_content);
							new_pdList.add(pd);
						}
					}
					list.add(pdList);
					list.add(new_pdList);
					book.close();

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					if (file != null && file.exists()) {
						file.delete();
					}
				}
			}
		}

		return list;

	}
}
