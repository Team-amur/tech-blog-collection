package com.amur.community.model.service;

import com.amur.community.model.CommunityDto;
import com.amur.community.model.CommunityListDto;
import com.amur.community.model.mapper.CommunityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CommunityServiceImpl implements CommunityService {


    private CommunityMapper dao;

    @Autowired
    public CommunityServiceImpl(CommunityMapper dao) {
        this.dao = dao;
    }

    @Override
    public void writeArticle(CommunityDto communityDto) throws Exception{
        dao.writeArticle(communityDto);
    }

    @Override
    public CommunityListDto listArticle(Map<String, String> map) throws Exception {
        return dao.listArticle(map);
    }

    @Override
    public CommunityDto getArticle(int articleno) throws Exception {
        return dao.getArticle(articleno);
    }

    @Override
    public void deleteArticle(int articleno) throws Exception {
        dao.deleteArticle(articleno);
    }
}
