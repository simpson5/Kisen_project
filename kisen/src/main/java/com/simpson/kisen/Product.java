package com.simpson.kisen;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Repository
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int pdNo; // �긽�뭹踰덊샇
	private int idolNo; // �븘�씠�룎 踰덊샇
 	private String pdCategory; // �긽�뭹遺꾨쪟
	private String pdName; // �긽�뭹�씠由�
	private String pdImg; // �긽�뭹�씠誘몄�
	private String pdContent; // �긽�뭹 �꽕紐�
	private int price; // �긽�뭹 媛�寃�
	private int pdStock; // �옱怨좊웾
	private int pdSale;  // �뙋留ㅻ웾 // 이게 머시여 왜 글씨 다 깨져서 나올까용
}
