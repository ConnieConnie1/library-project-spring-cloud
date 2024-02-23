package com.library.apigateway.config;

import com.library.apigateway.filter.AuthFilter;
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
        return builder.routes()
                .route("login-microservice:8084",r -> r.path("/api/users/insertUserDetails")
                        .filters(f -> f.filter(authFilter))
                        .uri("lb://LOGIN-MICROSERVICE"))
                .route("user-details:8084",r -> r.path("/api/users/details")
                        .filters(f -> f.filter(authFilter))
                        .uri("lb://LOGIN-MICROSERVICE"))
                .route("author-microservice:8085",r -> r.path("/api/authors/**")
                        .filters(f -> f.filter(authFilter))
                        .uri("lb://AUTHOR-MICROSERVICE"))
                .route("publisher-microservice:8086",r -> r.path("/api/publishers/**")
                        .filters(f -> f.filter(authFilter))
                        .uri("lb://PUBLISHER-MICROSERVICE"))
                .route("book-microservice:8081",r -> r.path("/api/books/**")
                        .filters(f -> f.filter(authFilter))
                        .uri("lb://BOOK-MICROSERVICE"))
                .route("eccomerce-microservice:8082",r -> r.path("/api/orders/**")
                        .filters(f -> f.filter(authFilter))
                        .uri("lb://ECCOMERCE-SERVICE"))
                .build();
    }

}
