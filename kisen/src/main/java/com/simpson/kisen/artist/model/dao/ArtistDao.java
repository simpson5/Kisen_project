package com.simpson.kisen.artist.model.dao;

import java.util.List;

import com.simpson.kisen.idol.model.vo.Idol;

public interface ArtistDao {

	List<Idol> selectAllIdolName();

	List<Idol> selectArtistOne(int no);

}
