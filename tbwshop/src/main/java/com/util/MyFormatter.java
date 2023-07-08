package com.util;

import java.text.SimpleDateFormat;
import java.util.*;
import org.springframework.format.Formatter;
import java.text.ParseException;
import java.util.Locale;

public class MyFormatter implements Formatter<Date> {
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public String print(Date object, Locale arg1) {
		return dateFormat.format(object);
	}

	@Override
	public Date parse(String source, Locale arg1) throws ParseException {
		return dateFormat.parse(source);
	}

}
