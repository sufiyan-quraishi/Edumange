package com.edumanage.config;

import com.edumanage.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                // Public pages and static resources
                .antMatchers(
                    "/", 
                    "/home", 
                    "/about", 
                    "/courses", 
                    "/contact",
                    "/inquiry/**", 
                    "/register", 
                    "/register/**",
                    "/registration",          // Added: /registration view page
                    "/registration/**",       // Added: /registration sub-paths
                    "/registration-success",  // Added: Confirmation landing page
                    "/css/**", 
                    "/js/**", 
                    "/videos/**", 
                    "/images/**", 
                    "/login"
                ).permitAll()
                
                // Role-restricted areas
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/trainer/**").hasRole("TRAINER")
                .antMatchers("/student/**").hasRole("STUDENT")
                .anyRequest().authenticated()
            .and()
            .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/perform_login")
                .successHandler(loginSuccessHandler())
                .failureUrl("/login?error=true")
                .permitAll()
            .and()
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout=true")
                .permitAll()
            .and()
            .exceptionHandling().accessDeniedPage("/access-denied")
            .and()
            .csrf().disable();
    }

    /**
     * Redirect users to their respective dashboards based on role after login.
     */
    @Bean
    public org.springframework.security.web.authentication.AuthenticationSuccessHandler loginSuccessHandler() {
        return (request, response, authentication) -> {
            String redirectUrl = "/login";
            for (org.springframework.security.core.GrantedAuthority auth : authentication.getAuthorities()) {
                if (auth.getAuthority().equals("ROLE_ADMIN")) {
                    redirectUrl = "/admin/dashboard";
                    break;
                } else if (auth.getAuthority().equals("ROLE_TRAINER")) {
                    redirectUrl = "/trainer/dashboard";
                    break;
                } else if (auth.getAuthority().equals("ROLE_STUDENT")) {
                    redirectUrl = "/student/dashboard";
                    break;
                }
            }
            response.sendRedirect(request.getContextPath() + redirectUrl);
        };
    }
}