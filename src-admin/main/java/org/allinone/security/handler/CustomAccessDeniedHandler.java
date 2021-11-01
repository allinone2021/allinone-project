package org.allinone.security.handler;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
public class CustomAccessDeniedHandler extends AccessDeniedHandlerImpl {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {

        log.error("---------------CustomAccessDeniedHandler");
        log.error("---------------CustomAccessDeniedHandler");
        log.error("content-type: "+request.getContentType());
        log.error("---------------CustomAccessDeniedHandler");
        log.error("---------------CustomAccessDeniedHandler");

        super.handle(request, response, accessDeniedException);
    }
}
