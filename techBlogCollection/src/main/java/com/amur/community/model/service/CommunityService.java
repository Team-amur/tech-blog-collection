package com.amur.community.model.service;


import com.amur.community.model.CommunityDto;
import com.amur.community.model.CommunityListDto;

import java.util.Map;

public interface CommunityService {
    void writeArticle(CommunityDto communityDto) throws Exception;

    CommunityListDto listArticle(Map<String, String> map) throws Exception;

    CommunityDto getArticle(int articleno) throws Exception;

    void deleteArticle(int articleno) throws Exception;
}
