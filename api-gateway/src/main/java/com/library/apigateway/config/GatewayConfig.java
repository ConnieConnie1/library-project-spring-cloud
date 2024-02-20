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
                .route("author-microservice:8085",r -> r.path("/api/authors/**")
                        .filters(f -> f.filter(authFilter))
                        .uri("lb://AUTHOR-MICROSERVICE"))
                .build();
    }

}
