package com.library.ecommerceMicroservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class EcommerceMicroserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(EcommerceMicroserviceApplication.class, args);
	}

}
