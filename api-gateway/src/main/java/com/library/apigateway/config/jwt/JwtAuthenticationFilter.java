package com.library.apigateway.config.jwt;

import io.jsonwebtoken.JwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

        @Autowired
        private SecretKey secretKey;

        @Override
        protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
            String token = extractToken(request);
            if (token == null) {
                // Token mancante
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }
            try {
                // Dividi il token nelle sue parti: header, payload e firma
                String[] tokenParts = token.split("\\.");
                if (tokenParts.length != 3) {
                    // Token non valido
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    return;
                }

                String encodedHeader = tokenParts[0];
                String encodedPayload = tokenParts[1];
                String encodedSignature = tokenParts[2];

                // Decodifica il payload per ottenere le informazioni
                String decodedPayload = new String(Base64.getDecoder().decode(encodedPayload), StandardCharsets.UTF_8);

                // Verifica la firma utilizzando la secretKey
                String calculatedSignature = calculateSignature(secretKey, encodedHeader, encodedPayload);
                if (!calculatedSignature.equals(encodedSignature)) {
                    // Firma non corrispondente
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    return;
                }
            } catch (JwtException | IllegalArgumentException e) {
                // Il token è scaduto o non è valido
                // Gestisci l'errore di autenticazione
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                return;
            } catch (NoSuchAlgorithmException | InvalidKeyException e) {
                throw new ServletException("Error processing JWT", e);
            }

            filterChain.doFilter(request, response);
        }
    private String calculateSignature(SecretKey secretKey, String encodedHeader, String encodedPayload) throws NoSuchAlgorithmException, InvalidKeyException {
        Mac hmacSha256 = Mac.getInstance("HmacSHA256");
        hmacSha256.init(secretKey);
        byte[] calculatedSignature = hmacSha256.doFinal((encodedHeader + "." + encodedPayload).getBytes(StandardCharsets.UTF_8));
        return Base64.getUrlEncoder().withoutPadding().encodeToString(calculatedSignature);
    }
    private String extractToken(HttpServletRequest request) {
        // Implementazione per l'estrazione del token JWT dalla richiesta HTTP
        // Esempio: header Authorization con formato "Bearer <token>"
        String header = request.getHeader("Authorization");
        if (header != null && header.startsWith("Bearer ")) {
            return header.substring(7); // Rimuovi "Bearer " dal token
        }
        return null;
    }
}
