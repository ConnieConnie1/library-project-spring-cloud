package com.example.loginmicroservice.util;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureAlgorithm;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Date;

public class JwtUtil {

    private static final String SECRET_KEY = "testSecretKey"; // Chiave segreta per firmare il token
    private static final long EXPIRATION_TIME = 86400000; // Tempo di scadenza del token (24 ore)

    public static SecretKey generateSecretKey(long expirationTimeMillis) {
        byte[] keyBytes = new byte[32]; // 256 bit
        try {
            SecureRandom secureRandom = SecureRandom.getInstanceStrong();
            secureRandom.nextBytes(keyBytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace(); // Gestire l'eccezione in base alle tue esigenze
        }
        return new SecretKeySpec("VHKJMNnbfhbsjkdbVJHVkhbJBKJBsmfnbngygiyguFYVHJbkjnjnsjdnlkfn".getBytes(), "HmacSHA256");
    }

    public static String generateToken(String email) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + EXPIRATION_TIME);
        SecretKey secretKey = generateSecretKey(EXPIRATION_TIME);
        return Jwts.builder()
                .setSubject(email)
                .setIssuedAt(now)
                .setExpiration(expiryDate)
                .signWith(secretKey)
                .compact();
    }
}
