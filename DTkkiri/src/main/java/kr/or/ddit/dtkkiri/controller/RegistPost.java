package kr.or.ddit.dtkkiri.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.dtkkiri.post.service.PostService;
import kr.or.ddit.dtkkiri.post.service.PostServiceImpl;
import kr.or.ddit.dtkkiri.vo.AtfileVO;
import kr.or.ddit.dtkkiri.vo.PostVO;

@WebServlet("/registPost.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*10, maxFileSize = 1024*1024*30, maxRequestSize = 1024*1024*100
		//각각 10mb, 30mb, 100mb
)
public class RegistPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// 데이터받기
		String title = request.getParameter("title");
		String cont = request.getParameter("content");
		String bcode = request.getParameter("boardCode");
		String id=request.getParameter("id");
		
		// 업로드되는 파일들이 저장될 폴더 설정
//		String uploadPath = this.getServletContext().getRealPath("/images/saveFileDerectory/");//실제 회사에선 서버에 올리기 때문에 이 방법이 맞으나 지금은 로컬 임시폴더에 저장됨
		String uploadPath="d:/DTkkiriSaveFileLocation";

		File f = new File(uploadPath);
		if (!f.exists())
			f.mkdirs(); // 경로가 없다면 경로 생성

		// 수신받은 파일 데이터 처리하기
		String fileName = ""; // 전송된 파일명이 저장될 변수 선언
		// upload한 파일 목록이 저장된 List객체 생성
		List<AtfileVO> fileList = new ArrayList<AtfileVO>();

		// service객체 생성
		PostService service = PostServiceImpl.getInstance();
		
		//게시글 등록하기
		PostVO pvo=new PostVO();
		pvo.setPost_bcode(bcode);
		pvo.setPost_cont(cont);
		pvo.setPost_tit(title);
		pvo.setPost_id(id);
		
		int check=service.registPost(pvo);
		
		if(check>0) {
			int post_num=  check; //service.sequenceVal();
			/*
			 * -Servlet 3.0이상에서 새롭게 추가된 Upload용 메서드 1) request.getParts() =>전체 Part객체를
			 * Collection객체에 담아서 반환한다. 2) request.getPart("Part이름") =>지정된 'Part이름'을 가진 개별
			 * Part객체를 반환한다.('Part이름'은 <form>태그 안의 입력요소의 name속성값)
			 */
			
			// 전체 Part객체 개수만큼 반복처리
			for (Part part : request.getParts()) {
				fileName = getFileNames(part);

				// 찾은 파일명이 공백문자("")이면 이것은 파일이 아닌 일반 파라미터라는 의미이다.
				if (!"".equals(fileName)) {
					// 파일 정보가 저장될 VO생성
					AtfileVO fvo = new AtfileVO();
					fvo.setAtfile_og_name(fileName);

					// 실제 저장되는 파일이름이 중복되는 것을 방지하기 위해서 UUID를 이용해서 중복되지 않는 파일명을 만든다.
					String saveFileName = UUID.randomUUID().toString();
					// 새로 만들어진 파일 저장파일명을 VO에 세팅한다.
					fvo.setAtfile_sv_name(saveFileName);
					// part.getSize()메서드 => upload된 파일의 크기를 반환(단위:byte)
					// byte단위의 파일 크기를 KB단위로 변환해서 VO에 세팅
					fvo.setAtfile_size((long)(Math.ceil(part.getSize() / 1024.0)));

					try {
						// upload된 파일을 서버의 저장 폴더에 저장하기
						// part.write()메서드 =>upload된 파일을 저장하는 메서드
						part.write(uploadPath + File.separator + saveFileName);
					} catch (Exception e) {
						e.printStackTrace();
					}
					fileList.add(fvo); // upload된 파일 정보를 List에 추가하기
				} // if문 끝...
			} // for문 끝...
			// List에 저장된 파일 정보들을 하나씩 DB에 추가하기
			for (AtfileVO fileVo : fileList) {
				fileVo.setAtfile_loc(uploadPath);
				fileVo.setAtfile_pnum(post_num);
				service.insertFile(fileVo);
			}
		}
		response.sendRedirect(request.getContextPath()+"/main/board.jsp?post_bcode="+bcode);
		
	}
	
	//Part구조 안에서 파일명을 찾는 메서드
		private String getFileNames(Part part) {
			String fileName = "";
			
			//content-disposition헤더 정보 구하기
			String headerValue = part.getHeader("content-disposition");
			String[] items = headerValue.split(";");
			for(String item : items) {
				if(item.trim().startsWith("filename")) {
					fileName = item.substring(item.indexOf("=")+2, item.length()-1);
				}
			}
			
			return fileName;
		}

}
