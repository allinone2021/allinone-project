package org.allinone.security.handler;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest req, HttpServletResponse res, AuthenticationException authException) throws IOException, ServletException {

        log.error("------------------CustomAuthenticationEntryPoint-----------------");
        log.error("------------------CustomAuthenticationEntryPoint-----------------");
        log.error(authException);
        log.error("------------------CustomAuthenticationEntryPoint-----------------");
        log.error("------------------CustomAuthenticationEntryPoint-----------------");

        //인증 문제 발생 시
        if(req.getContentType() != null && req.getContentType().contains("json")){
            res.setContentType("application/json;charset=UTF-8");
            res.setStatus(403);  //상태 코드 변경
            res.getWriter().write("{\'msg\':\'REST API ERROR\'}");  //json data 전송
        }else {

            res.sendRedirect("/customLogin?goAllinOne");  //페이지 리다이렉트
        }
    }
}
