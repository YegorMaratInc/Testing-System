package ru.licpnz.testingsystem.apps;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
@ComponentScan("ru.licpnz.testingsystem")
@EnableJpaRepositories("ru.licpnz.testingsystem.repositories")
@EntityScan("ru.licpnz.testingsystem.models")
public class TestingSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(TestingSystemApplication.class, args);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
