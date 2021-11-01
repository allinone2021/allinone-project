package org.allinone.common.config;

import lombok.extern.log4j.Log4j2;
import org.allinone.event.config.EventRootConfig;
import org.allinone.event.config.EventServletConfig;
import org.allinone.faq.config.FAQRootConfig;
import org.allinone.faq.config.FAQServletConfig;
import org.allinone.freeBoard.config.FreeBoardRootConfig;
import org.allinone.freeBoard.config.FreeBoardServletConfig;
import org.allinone.member.config.MemberRootConfig;
import org.allinone.member.config.MemberServletConfig;
import org.allinone.notice.config.NoticeRootConfig;
import org.allinone.notice.config.NoticeServletConfig;
import org.allinone.order.config.OrderRootConfig;
import org.allinone.order.config.OrderServletConfig;
import org.allinone.qna.config.QnARootConfig;
import org.allinone.qna.config.QnAServletConfig;
import org.allinone.statement.config.StatementRootConfig;
import org.allinone.statement.config.StatementServletConfig;
import org.allinone.statistic.config.StatisticRootConfig;
import org.allinone.statistic.config.StatisticServletConfig;
import org.allinone.storeinfo.config.StoreInfoRootConfig;
import org.allinone.storeinfo.config.StoreInfoServletConfig;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

@Log4j2
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        log.info("1-------------------------------");
        log.info("1-------------------------------");

        return new Class[]{RootConfig.class, MemberRootConfig.class, StoreInfoRootConfig.class, EventRootConfig.class,
                OrderRootConfig.class, StatementRootConfig.class, StatisticRootConfig.class, FreeBoardRootConfig.class,
                FAQRootConfig.class, NoticeRootConfig.class, QnARootConfig.class
        };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        log.info("2-------------------------------");
        log.info("2-------------------------------");

        return new Class[]{ServletConfig.class, MemberServletConfig.class, StoreInfoServletConfig.class, EventServletConfig.class,
                OrderServletConfig.class, StatementServletConfig.class, StatisticServletConfig.class, FreeBoardServletConfig.class,
                FAQServletConfig.class, NoticeServletConfig.class, QnAServletConfig.class
        };
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter utf8filter = new CharacterEncodingFilter();
        utf8filter.setEncoding("UTF-8");
        utf8filter.setForceEncoding(true);

        return new Filter[]{utf8filter};
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");

        MultipartConfigElement multipartConfigElement =
                new MultipartConfigElement("C:\\upload\\temp",1024*1024*10, 1024*1024*20, 1024*1024*1 );
        registration.setMultipartConfig(multipartConfigElement);
    }

}