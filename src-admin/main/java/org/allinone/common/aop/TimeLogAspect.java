package org.allinone.common.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Aspect
@Log4j2
@Component
public class TimeLogAspect {

    {
        log.info("TimeLogAspect................");
        log.info("TimeLogAspect................");
        log.info("TimeLogAspect................");
        log.info("TimeLogAspect................");
        log.info("TimeLogAspect................");
    }

    @Before("execution(* org.allinone.*.service.*.*(..))")
    public void logBefore(JoinPoint joinPoint) {
        log.info("logBefore...........................");

        log.info(joinPoint.getTarget());
        log.info(Arrays.toString(joinPoint.getArgs()));

        log.info("logBefore...........................END");
    }

    @AfterReturning("execution(* org.allinone.*.service.*.*(..))")
    public void logAfter() {
        log.info("logAfter............................");
    }

}
