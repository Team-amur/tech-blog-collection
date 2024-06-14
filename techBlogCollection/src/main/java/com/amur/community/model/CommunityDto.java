package com.amur.community.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
@Setter
public class CommunityDto {
    private int boardId;
    private String title;
    private String memberId;
    private String content;
    private int likeCount;
    private int readCount;
    private String registerTime;
    private String updateTime;
    private int type;
}
