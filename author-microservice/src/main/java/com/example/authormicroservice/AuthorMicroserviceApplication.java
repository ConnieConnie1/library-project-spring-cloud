package com.example.authormicroservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class AuthorMicroserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(AuthorMicroserviceApplication.class, args);
	}

}
