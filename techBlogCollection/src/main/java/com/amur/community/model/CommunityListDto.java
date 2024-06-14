package com.amur.community.model;

import com.amur.community.model.CommunityDto;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class CommunityListDto {
    private List<CommunityDto> articles;
    private int currentPage;
    private int totalPageCount;

}
