package com.amur.community.model.mapper;

import com.amur.community.model.CommunityDto;
import com.amur.community.model.CommunityListDto;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.Map;

@Mapper
public interface CommunityMapper {
    void writeArticle(CommunityDto communityDto)  throws SQLException;;

    CommunityListDto listArticle(Map<String, String> map) throws SQLException;

    CommunityDto getArticle(int articleno) throws SQLException;

    void deleteArticle(int articleno) throws  SQLException;
}
