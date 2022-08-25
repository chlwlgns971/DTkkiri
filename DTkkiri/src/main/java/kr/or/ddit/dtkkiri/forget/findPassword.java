package kr.or.ddit.dtkkiri.forget;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.dtkkiri.member.service.MemberService;
import kr.or.ddit.dtkkiri.member.service.MemberServiceImpl;
import kr.or.ddit.dtkkiri.vo.MemberVO;

@WebServlet("/findPassword.do")
public class findPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				request.setCharacterEncoding("UTF-8");

				// 클라이언트 전송시 전달 데이터 받기
				String userId = request.getParameter("name");


				// service객체 얻기
				MemberService service = MemberServiceImpl.getInstance();

				// service메소드 호풀 결과값 받기

				String res = service.findPassword(userId);
				System.out.println("S값 >>" + res);
				
				if(res!=null) {
				request.setAttribute("getpass", res);

				
				
				
				String pass = res;
				
				
				String host = "smtp.gmail.com";					// SMTP 서비스를 해주는 메일 사이트
				final String user = "DTkkiri@gmail.com";		// SMTP 서비스로 사용할 메일
				final String password = "lkuwqdsxvbodnzuj";		// 메일 비밀번호
				
				
				String to = request.getParameter("email");		// 송신 메일 수신할 이메일

			    // Get the session object
			      Properties props = new Properties();
			      props.put("mail.smtp.host", host);      // 이메일 발송을 처리해줄 SMTP 서버
			      props.put("mail.smtp.auth", "true");   // 설정한 이메일 SMTP서버에 접속할 수 있는 권한 취득
			      props.put("mail.smtp.ssl.enable", "true");
			      props.put("mail.smtp.starttls.enable", "true");
			      
			   // 인증 번호 생성기
					StringBuffer temp = new StringBuffer();
					Random rnd = new Random();
					for (int i = 0; i < 4; i++) {
						int rIndex = rnd.nextInt(3);
						switch (rIndex) {
						case 0:
							// a-z
							temp.append((char) ((int) (rnd.nextInt(26)) + 97));
							break;
						case 1:
							// A-Z
							temp.append((char) ((int) (rnd.nextInt(26)) + 65));
							break;
						case 2:
							// 0-9
							temp.append((rnd.nextInt(10)));
							break;
						}
					}
					String AuthenticationKey = temp.toString();
					System.out.println(AuthenticationKey);
			      
				      // 세션 : 클라이언트 별로 서버에 저장되는 정보 (
				      // 사용자 컴퓨터에 저장되던 쿠키와 다르게 서버에 저장되므로, 비교적 보안이 필요한 데이터는 쿠키보다 세션에 저장한다.
				      // 서버가 종료되거나 유효기간이 지나면 사라진다.
				      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {  // 설정값을 저장하여 세션 생성
				         protected PasswordAuthentication getPasswordAuthentication() {
				            return new PasswordAuthentication(user, password);      // 관리자 PASSWORD 인증
				         }
				      });
				      
				      
				   // email 전송 1. 비밀번호찾기
				      try {
				         // 위에 설정한 내용을 가지고 mimeMessage클래스 생성
				         // 실질적인 메일 작성 클래스 ( 메일 제목, 내용 등등)
				         MimeMessage message = new MimeMessage(session);
				         
				         // 발신자 셋팅
				         message.setFrom(new InternetAddress(user, "DT끼리"));   // SMTP 발신자 이메일 주소
				         
				         // 수신자 셋팅
				         // RecipientType = 받는사람 유형 (그룹, 사용자, 사서함, 폴더 등등)
				         // InternetAddress(받는사람 메일)
				         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

				         // Subject
				         // 메일 제목
				         message.setSubject("[DT끼리] 회원찾기 인증메일입니다.");
				         
				         
				         // Text
				         // 메일 내용
				         message.setText("send!!");      // 텍스트 보내기
				         message.setContent("안녕하세요. 'DT끼리' 커뮤니티 홈페이지를 이용해주셔서 감사합니다. <br>"
				         		+ "<h3>비밀번호는 "+ res +"입니다.</h3>"
				               ,"text/html; charset=euc-kr");   // html 형식으로 보내기, pass에 초기 비밀번호값 입력

				         // send the message
				         // 메일 전송
				         Transport.send(message);
				         
				        


				} catch (MessagingException e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}

				// view페이지 이동
				request.getRequestDispatcher("findPage/findPwEnd.jsp").forward(request, response);
				
				
				}
			}
		}