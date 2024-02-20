package com.library.apigateway.config;

import com.library.apigateway.filter.AuthFilter;
import com.library.apigateway.record.AuthorRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GatewayConfig {
    @Autowired
    AuthFilter authFilter;

    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
        // adding 2 rotes to first microservice as we need to log request body if method is POST
        return builder.routes()
                .route("author-microservice:8085",r -> r.path("/api/authors/**")
                        .filters(f -> f.filter(authFilter))
                       // .and().method("GET")
                       // .and().readBody(AuthorRecord.class, s -> true).filters(f -> f.filters(authFilter))
                        .uri("lb://AUTHOR-MICROSERVICE"))
                .build();
    }


    /*@Bean
    public WebFilter responseFilter(){
        return new PostGlobalFilter();
    }*/

}
