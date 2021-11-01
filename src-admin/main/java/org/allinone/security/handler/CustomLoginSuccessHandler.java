package org.allinone.security.handler;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        log.warn("--------------------CustomLoginSuccessHandler--------------------");
        log.warn("--------------------CustomLoginSuccessHandler--------------------");
        log.warn(authentication);
        log.warn("--------------------CustomLoginSuccessHandler--------------------");
        log.warn("--------------------CustomLoginSuccessHandler--------------------");
    }
}
