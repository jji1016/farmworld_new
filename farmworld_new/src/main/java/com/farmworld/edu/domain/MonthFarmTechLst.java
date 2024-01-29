package com.farmworld.edu.domain;

import lombok.Data;

import java.util.List;

@Data
public class MonthFarmTechLst {

    private Header header;
    private Body body;

    @Data
    public static class Header {
        private String resultCode;
        private String resultMsg;
        private String requestParameter;
    }

    @Data
    public static class Body {
        private Items items;
    }

    @Data
    public static class Items {
        private Item[] item;  // List<Item>를 Item[]으로 변경
        private int numOfRows;
        private int pageNo;
        private int totalCount;
    }


    @Data
    public static class Item {
        private String atchmnflGroupEsntlCode;
        private String atchmnflSn;
        private String atchmnflStreNm;
        private String clCodeNm;
        private String contentCnt;	
        private String curationImgUrl;
        private String curationNm;
        private String curationNo;
        private String curationSumryDtl;
        private String rdcnt;
        private String recomendAt;
        private String streCours;
        private String svcDt;
        private String thumbFileNm;
    }
}
