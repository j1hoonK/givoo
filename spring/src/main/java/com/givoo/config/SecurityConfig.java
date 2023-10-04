package com.givoo.config;
import com.givoo.service.MemberService;
import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;


@Configuration
public class SecurityConfig {

    @Autowired
    MemberService memberService;
    @Bean
    MvcRequestMatcher.Builder mvc() {
        return new MvcRequestMatcher.Builder(new HandlerMappingIntrospector());
    }


    @Bean
    protected SecurityFilterChain securityFilterChain(HttpSecurity http, MvcRequestMatcher.Builder mvc) throws Exception {
        AuthenticationManagerBuilder authManager =http.getSharedObject(AuthenticationManagerBuilder.class);
        authManager.userDetailsService(memberService).passwordEncoder(passwordEncoder());

        http.securityContext(securityContext -> securityContext.requireExplicitSave(false))
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(
                        (auth) ->auth.requestMatchers(mvc.pattern("/"),
                                        mvc.pattern("/members/**"),mvc.pattern("/item/**"),mvc.pattern( "/images/**"))
                                .permitAll()
                                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                )
                .formLogin((formLogin) ->
                        formLogin.failureUrl("/members/login/error")
                                .loginPage("/members/login")
                                .defaultSuccessUrl("/")
                                .usernameParameter("username")
                                .passwordParameter("password")

                )
                .logout((logout) ->
                        logout.logoutRequestMatcher(new AntPathRequestMatcher("/members/logout"))
                                .logoutSuccessUrl("/"));

        return http.build();
    }
    @Bean
    public HttpFirewall httpFirewall(){
        return new DefaultHttpFirewall();
    }
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer(MvcRequestMatcher.Builder mvc){
        return (web -> web.ignoring().
                requestMatchers(mvc.pattern("/css/**"),mvc.pattern("/js/**"),mvc.pattern("/img/**")));
    }
    @Bean
    public static PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}