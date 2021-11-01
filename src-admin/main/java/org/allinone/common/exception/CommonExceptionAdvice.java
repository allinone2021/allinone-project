package org.allinone.common.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Log4j2
public class CommonExceptionAdvice {

    @ExceptionHandler(Exception.class)
    public String exceptionAll(Exception ex, Model model){
        log.error(ex.getClass().getName());
        log.error(ex.getMessage());
        model.addAttribute("exception", ex);

        return "error_page";
    }

    @ExceptionHandler(ArithmeticException.class)
    public String exceptArithmetic(ArithmeticException ex, Model model){

        log.info("exceptArithmetic");
        log.error(ex.getClass().getName());
        log.error(ex.getMessage());
        model.addAttribute("exception", ex);

        return "error_arithmetic_page";
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404(NoHandlerFoundException ex){
        return "custom404";
    }
}