package com.simpson.kisen.artist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simpson.kisen.artist.model.dao.ArtistDao;
import com.simpson.kisen.idol.model.vo.Idol;

@Service
public class ArtistServiceImpl implements ArtistService {

	@Autowired
	private ArtistDao artistDao;
	
	@Override
	public List<Idol> selectAllIdolName() {
		return artistDao.selectAllIdolName();
	}

	@Override
	public List<Idol> selectArtistOne(int no) {
		return artistDao.selectArtistOne(no);
	}

}
