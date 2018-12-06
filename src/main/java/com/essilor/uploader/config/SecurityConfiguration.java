package com.essilor.uploader.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Value("${login.username}")
    public String loginUsername;

    @Value("${login.password}")
    public String loginPassword;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/").permitAll()
            .antMatchers("/health").permitAll()
            .antMatchers("/home").hasAnyRole("ADMIN")
            .antMatchers("/upload").hasAnyRole("ADMIN")
            .antMatchers("/list").hasAnyRole("ADMIN")
            .anyRequest().authenticated().and().formLogin().loginPage("/login")
            .permitAll().and().logout().permitAll();

        http.csrf().disable();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {

        authenticationMgr.inMemoryAuthentication()
            .withUser(loginUsername).password(loginPassword).authorities("ROLE_USER", "ROLE_ADMIN");
    }

}
