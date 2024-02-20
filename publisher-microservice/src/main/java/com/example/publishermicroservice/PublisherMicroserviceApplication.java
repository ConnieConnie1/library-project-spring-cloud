package com.example.publishermicroservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class PublisherMicroserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(PublisherMicroserviceApplication.class, args);
	}

}
