package com.amur.TechBlogCollection;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.amur")
public class TechBlogCollectionApplication {

	public static void main(String[] args) {
		SpringApplication.run(TechBlogCollectionApplication.class, args);
	}

}
