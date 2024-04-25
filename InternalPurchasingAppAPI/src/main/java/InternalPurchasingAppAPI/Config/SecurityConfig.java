package InternalPurchasingAppAPI.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.jwt.*;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.oauth2.jwt.JwtDecoder;



@Configuration //to defines beans
@EnableWebSecurity

public class SecurityConfig {

//    private final JwtDecoder jwtDecoder;
//
//    public SecurityConfig(JwtDecoder jwtDecoder) {
//        this.jwtDecoder = jwtDecoder;
//    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
//                        .anyRequest().authenticated()
                        .requestMatchers("/orders/**").authenticated()
                                .anyRequest().authenticated()//any request to the API needs to be authenticated
                )
                .oauth2ResourceServer((oauth2) -> oauth2.jwt(Customizer.withDefaults()));
        return http.build();
    }

  //jwt decoder who will decipher the jwt.
//    @Bean
//    public JwtDecoder jwtDecoder() {
//        return JwtDecoders.fromIssuerLocation("https://bitbuggy.b2clogin.com/533398db-accf-4cf9-bee1-6b65ce5aa8b9/v2.0/");
//   }

}