package com.givoo.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
@OpenAPIDefinition
public class SwaggerConfig {
    @Bean
    // localhost:xxxx/swagger-ui/index.html#/
    public OpenAPI baseOpenAPI(){
        return new OpenAPI().info(new Info().title("API 명세서").version("1.0").description("기부플랫폼 API 명세서"));
    }
}



