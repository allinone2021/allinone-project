package org.allinone.common.converter;

import lombok.extern.log4j.Log4j2;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Log4j2
@Component
public class StringToLocalTimeConverter implements Converter<String, LocalTime> {

    @Override
    public LocalTime convert(String source) {
        log.info("--------------------------------------");
        log.info("converter: " + source);

        Pattern pattern =  Pattern.compile("^([01][0-9]|2[0-3]):([0-5][0-9])$");
        Matcher matcher = pattern.matcher(source);

        log.info("---------- 1 TimeConverter ----------");
        log.info("-------------------------------------");

        boolean matchResult = matcher.find();

        log.info("--------------------------" + matchResult);

        if(matchResult) {
            log.info("---------- 2 matchResult ----------");
            return LocalTime.parse(
                    source, DateTimeFormatter.ISO_LOCAL_TIME);
        }
        return LocalTime.now();
    }
}
