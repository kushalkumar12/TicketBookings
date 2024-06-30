package com.work;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.Validator;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.AsyncSupportConfigurer;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan
public class Config implements WebMvcConfigurer {
  @Override
  public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
    configurer.enable();
  }

  @Override
  public void addViewControllers(ViewControllerRegistry registry) {
    registry.addViewController("/").setViewName("forward:/index.jsp");
  }

  @Bean
  public ViewResolver viewResolver() {
    InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
    viewResolver.setViewClass(JstlView.class);
   // viewResolver.setPrefix("/");
   // viewResolver.setSuffix(".jsp");
    return viewResolver;
  }

@Override
public void addFormatters(FormatterRegistry registry) {
	// TODO Auto-generated method stub

}

@Override
public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
	// TODO Auto-generated method stub

}

@Override
public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
	// TODO Auto-generated method stub

}

@Override
public Validator getValidator() {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
	// TODO Auto-generated method stub

}

@Override
public void configureAsyncSupport(AsyncSupportConfigurer configurer) {
	// TODO Auto-generated method stub

}

@Override
public void configurePathMatch(PathMatchConfigurer configurer) {
	// TODO Auto-generated method stub

}

@Override
public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
	// TODO Auto-generated method stub

}

@Override
public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
	// TODO Auto-generated method stub

}

@Override
public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
	// TODO Auto-generated method stub

}

@Override
public void addInterceptors(InterceptorRegistry registry) {
	// TODO Auto-generated method stub

}

@Override
public MessageCodesResolver getMessageCodesResolver() {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void configureViewResolvers(ViewResolverRegistry registry) {
	// TODO Auto-generated method stub

}

@Override
public void addResourceHandlers(ResourceHandlerRegistry registry) {
	// TODO Auto-generated method stub

}
}