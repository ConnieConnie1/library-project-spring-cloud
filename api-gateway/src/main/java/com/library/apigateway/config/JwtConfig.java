package com.library.apigateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

@Configuration
public class JwtConfig {

    @Bean
    public SecretKey secretKey() {
        byte[] keyBytes = new byte[32]; // 256 bit
        try {
            SecureRandom secureRandom = SecureRandom.getInstanceStrong();
            secureRandom.nextBytes(keyBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error generating secret key", e);
        }
        return new SecretKeySpec(keyBytes, "HmacSHA256");
    }
}
