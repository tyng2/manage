package com.manage.service.paging;

public class CommonProperties {
	/**
	 * 기본 셋
	 */
	//기본 리스트 사이즈
	public static final int VIEWCOUNT = 3;
	//기본 페이지 사이즈
	public static final int PAGECOUNT = 10;
	//검색 기준일
	public static final int SEARCHDATEAREA = 30;
	
	/**
	 * Ajax Result
	 */
	public static final String RESULT_SUCCESS = "SUCCESS";
	
	public static final String RESULT_FAILED = "FAILED";

	public static final String RESULT_ERROR = "ERROR";
	
	/**
	 * 파일 업로드
	 */
	//파일 업로드 경로
	public static final String FILE_UPLOAD_PATH = "D:\\my work\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core"
													+ "\\tmp0\\wtpwebapps\\HeyWe\\resources\\upload";
			
												/*"D:\\MyWork2\\workspace\\.metadata"
												+ "\\.plugins\\org.eclipse.wst.server.core"
												+ "\\tmp0\\wtpwebapps\\HeyWe\\resources\\upload";*/
	
	
	//파일 다운로드 경로
	public static final String FILE_DOWNLOAD_PATH = "http://localhost:8080/sample";
	
	//허용파일 확장자
	public static final String FILE_EXT = "xls|ppt|doc|xlsx|pptx|docx|hwp|csv|jpg|jpeg|png|gif|bmp|tld|txt|pdf";
	public static final String IMG_EXT = "jpg|jpeg|png|gif|bmp";
	
	/**
	 * 암호화키(AES기반 16글자)
	 */
	public static final String SECURE_KEY = "goodeeheywe12345";
}
