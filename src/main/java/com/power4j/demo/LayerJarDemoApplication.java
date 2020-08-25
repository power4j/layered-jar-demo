package com.power4j.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.time.LocalDateTime;

@RestController
@SpringBootApplication
public class LayerJarDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(LayerJarDemoApplication.class, args);
	}

	@GetMapping("/")
	public Mono<String> hello(){
		return Mono.just(LocalDateTime.now().toString());
	}
}
