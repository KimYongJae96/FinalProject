package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.NoticeDAO;
import kh.spring.dto.NoticeDTO;
import kh.spring.dto.NoticeFileDTO;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO nDAO;
	
	public int insertNomalNotice(NoticeDTO dto) {
		return nDAO.insertNomalNotice(dto);
	}
	public int deleteNotice(int n_seq) {
		return nDAO.deleteNotice(n_seq);
	}
	public int deleteNoticeFile(int n_seq) {
		return nDAO.deleteNoticeFile(n_seq);
	}
	public int selectLastSeq() {
		return nDAO.selectLastSeq();
	}
	public int selectseq() {
		return nDAO.selectseq();
	}
	public int selectn_seq() {
		return nDAO.selectn_seq();
	}
	public int insertNoticeFile(NoticeFileDTO dto) {
		return nDAO.insertNoticeFile(dto);
	}
	public int updateNoticeFile(NoticeFileDTO dto) {
		return nDAO.updateNoticeFile(dto);
	}
	public List<NoticeDTO> selectNomalNotice(){
		return nDAO.selectNomalNotice();
	}
	public NoticeDTO selectNomalNotice_Info(int n_seq) {
		return nDAO.selectNomalNotice_Info(n_seq);
	}
	public List<NoticeFileDTO> selectNomalNoticeFile(int n_seq){
		return nDAO.selectNomalNoticeFile(n_seq);
	}
	public int updateNomalNotice(NoticeDTO dto) {
		return nDAO.updateNomalNotice(dto);
	}
	//Scolar
	public int insertScolarNotice(NoticeDTO dto) {
		return nDAO.insertScolarNotice(dto);
	}
	public List<NoticeDTO> selectScolarNotice(){
		return nDAO.selectScolarNotice();
	}
	public NoticeDTO selectScolarNotice_Info(int n_seq) {
		return nDAO.selectScolarNotice_Info(n_seq);
	}
	public List<NoticeDTO> selectScolarNoticeFile(int n_seq){
		return nDAO.selectScolarNoticeFile(n_seq);
	}
	//Bachelor
	public List<NoticeDTO> selectBachelorNotice(){
		return nDAO.selectBachelorNotice();
	}
	//Employee
	public List<NoticeDTO> selectEmployNotice(){
		return nDAO.selectEmployNotice();
	}

}
