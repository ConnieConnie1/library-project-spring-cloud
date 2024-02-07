package com.library.apigateway.config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringCloudConfig {

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()
                .route("bookModule", r -> r.path("/book/**")
                        .uri("lb://FIRST-SERVICE"))
                .route("ecommerceModule", r -> r.path("/ecommerce/**")
                        .uri("lb://SECOND-SERVICE"))
                .build();
    }
}
