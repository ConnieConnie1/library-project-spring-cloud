package com.library.apigateway.config;

import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.discovery.ReactiveDiscoveryClient;
import org.springframework.cloud.gateway.discovery.DiscoveryClientRouteDefinitionLocator;
import org.springframework.cloud.gateway.discovery.DiscoveryLocatorProperties;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GatewayConfig {
    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()
                .build();
    }
    @Bean
    public DiscoveryClientRouteDefinitionLocator discoveryClientRouteLocator(ReactiveDiscoveryClient discoveryClient, DiscoveryLocatorProperties properties) {
        return new DiscoveryClientRouteDefinitionLocator(discoveryClient, properties);
    }
}
