package InternalPurchasingAppAPI.Config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration //to defines beans
@EnableWebSecurity

public class SecurityConfig {
    @Bean      //to create profiles
    public InMemoryUserDetailsManager user() {
        return new InMemoryUserDetailsManager(
            User.withUsername("Euris")
                    .password("{noop}password")
                    .authorities("read")
                    .build()
        );
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                //.oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt)
                .csrf(csrf-> csrf.disable()) //disbles protection
                .authorizeHttpRequests(auth->auth
                        .anyRequest().authenticated())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

                .httpBasic(Customizer.withDefaults())



                .build();


    }

}