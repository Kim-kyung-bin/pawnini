package com.pawnini.model.paws;

import java.util.List;

public interface pawsService {
	
	// 동물 정보 등록
	void insertPaws(pawsDTO dto);
	
	// 동물 정보 수정
	void updatePaws(pawsDTO dto);
	
	// 동물 정보 삭제
	void deletePaws(pawsDTO dto);
	
	// 동물 정보 리스트
	List<pawsDTO> getPawsList(pawsDTO dto);
	
	// 총 등록 갯수
	int getCountPaws(pawsDTO dto);
	
}
