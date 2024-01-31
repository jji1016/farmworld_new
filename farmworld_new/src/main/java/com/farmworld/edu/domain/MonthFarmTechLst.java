package com.farmworld.edu.domain;

import lombok.Data;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

@Data
public class MonthFarmTechLst {

    private Header header;
    private Body body;

    @Data
    public static class Header {
        private String resultCode;
        private String resultMsg;
        private String requestParameter;
    } //Header

    @Data
    public static class Body {
        private Items items;
        
        @Data
        public static class Items {
            private Item[] item;  
            private int numOfRows;
            private int pageNo;
            private int totalCount;
            
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
                
            } //Item
            
        } // Items
        
    } // Body
    
} // MonthFarmTechLst
