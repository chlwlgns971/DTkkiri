package kr.or.ddit.dtkkiri.post.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dtkkiri.post.dao.PostDao;
import kr.or.ddit.dtkkiri.post.dao.PostDaoImpl;
import kr.or.ddit.dtkkiri.vo.AtfileVO;
import kr.or.ddit.dtkkiri.vo.PageVO;
import kr.or.ddit.dtkkiri.vo.PostVO;

public class PostServiceImpl implements PostService {
	private PostDao dao;
	private static PostService service;

	public PostServiceImpl() {
		dao = PostDaoImpl.getInstance();
	}

	public static PostService getInstance() {
		if (service == null)
			service = new PostServiceImpl();
		return service;
	}

	@Override
	public int postCount(String boardCode) {
		return dao.postCount(boardCode);
	}

	@Override
	public List<PostVO> postList(Map<String, Object> map) {
		return dao.postList(map);
	}

	@Override
	public int totalPage(String boardCode, Map<String, String> map) {
		//전체 게시글 수 구하기
		int postCount=0;
		if(map==null) postCount = this.postCount(boardCode);
		else if(map!=null) postCount=this.searchCount(map);
		
		//전체 페이지수 구하기
		int totalPage = (int) Math.ceil((double)postCount/ PageVO.getPerList());
		return totalPage;
	}
	
	@Override
	public PageVO pageInfo(int page, String boardCode, Map<String, String> map) {
		// 전체 페이지 수 구하기
		int totalPage = this.totalPage(boardCode,map);
		
		// 전체 게시글 수 구하기
		int postCount=0;
		if(map==null) postCount = this.postCount(boardCode);
		else if(map!=null) postCount=this.searchCount(map);

		// start, end, startpage, endpage, totalpage
		// 1페이지 1,2,3 2페이지4,5,6 .../ 7.8.9
		int start = (page - 1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		if (end > postCount)end = postCount;

		int startPage = ((page - 1) / PageVO.getPerPage() * PageVO.getPerPage()) + 1;
		int endPage = startPage + PageVO.getPerPage() - 1;
		if (endPage > totalPage)endPage = totalPage;

		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);

		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalpage(totalPage);

		return vo;
	}

	@Override
	public PostVO showPost(int postNum) {
		return dao.showPost(postNum);
	}

	@Override
	public void plusViewNum(int postNum) {
		dao.plusViewNum(postNum);
	}

	@Override
	public void plusRecNum(int postNum) {
		dao.plusRecNum(postNum);
	}

	@Override
	public int registPost(PostVO vo) {
		return dao.registPost(vo);
	}

	@Override
	public void insertFile(AtfileVO vo) {
		dao.insertFile(vo);
	}
	@Override
	public List<AtfileVO> getImageFileInfo(int postNum) {
		return dao.getImageFileInfo(postNum);
	}

	@Override
	public AtfileVO getFileInfo(String fileName) {
		return dao.getFileInfo(fileName);
	}

	@Override
	public List<PostVO> searchPost(Map<String, Object> map) {
		return dao.searchPost(map);
	}

	@Override
	public int searchCount(Map<String, String> map) {
		return dao.searchCount(map);
	}

	@Override
	public void deleteFile(int postNum) {
		dao.deleteFile(postNum);
	}

	@Override
	public void deletePost(int postNum) {
		dao.deletePost(postNum);
	}

	@Override
	public void updatePost(Map<String, Object> map) {
		dao.updatePost(map);
	}

	@Override
	public List<AtfileVO> getPostFileInfo(int postNum) {
		return dao.getPostFileInfo(postNum);
	}
}
