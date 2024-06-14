package com.amur.community.controller;

import com.amur.community.model.CommunityDto;
import com.amur.community.model.CommunityListDto;
import com.amur.community.model.service.CommunityService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.Charset;
import java.util.Map;

@Slf4j
@RestController
@CrossOrigin("*")
@RequestMapping("/community")
public class CommunityController {

    private CommunityService communityService;

    @Autowired
    public CommunityController(CommunityService communityService) 
    {

        this.communityService = communityService;
    }
    
    //게시글 작성
    @PostMapping
    public ResponseEntity<?> writeArticle(@RequestBody CommunityDto communityDto){
        try {
            communityService.writeArticle(communityDto);
            System.out.println("게시글 작성");
            return new ResponseEntity<Void>(HttpStatus.CREATED);
        }
        catch (Exception e){
            return exceptionHandling(e);
        }
    }
    //게시글 리스트
    @GetMapping
    public ResponseEntity<?> listArticle(@RequestBody Map<String, String> map){
        try{
            CommunityListDto communityListDto = communityService.listArticle(map);
            HttpHeaders header = new HttpHeaders();
            header.setContentType(new MediaType("aplication", "json", Charset.forName("UTF-8")));
            return ResponseEntity.ok().headers(header).body(communityListDto);
        }catch (Exception e){
            return exceptionHandling(e);
        }
    }
    //게시글 디테일
    @GetMapping("/{boardId}")
    public ResponseEntity<CommunityDto> getArticle(@PathVariable("boardId") int boardId ) throws Exception{
              log.info("getArticle called with boardId: " + boardId);
            return new ResponseEntity<CommunityDto>(communityService.getArticle(boardId),HttpStatus.OK);

    }
    //게시글 삭제
    @DeleteMapping("/{articleno}")
    public ResponseEntity<String> deleteArticle(@PathVariable("articleno") int articleno ) throws Exception {
    communityService.deleteArticle(articleno);
    return ResponseEntity.ok().build();
    }
    //게시글 수정


    private ResponseEntity<String> exceptionHandling(Exception e)
    {
        e.printStackTrace();
        return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
