package com.citysmart.ucenter.component.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

@Configuration //标记配置类
@Profile({"dev","test"})
@EnableSwagger2 //开启在线接口文档
public class Swagger2Config {
    /**
     * 添加摘要信息(Docket)
     */
    @Bean
    public Docket controllerApi() {
        //添加head参数start
        List<Parameter> pars = new ArrayList<Parameter>();
        ParameterBuilder tokenPar;

        tokenPar = new ParameterBuilder();
        tokenPar.name("v").description("客户端版本").modelRef(new ModelRef("string")).parameterType("header").required(false)
                .build();
        pars.add(tokenPar.build());

        tokenPar = new ParameterBuilder();
        tokenPar.name("p").description("客户端系统标识").modelRef(new ModelRef("string")).parameterType("header").required(false)
                .build();
        pars.add(tokenPar.build());

        tokenPar = new ParameterBuilder();
        tokenPar.name("cid").description("客户端唯一标识").modelRef(new ModelRef("string")).parameterType("header").required(false)
                .build();
        pars.add(tokenPar.build());

        tokenPar = new ParameterBuilder();
        tokenPar.name("osv").description("客户端操作系统的版本号").modelRef(new ModelRef("string")).parameterType("header").required(false)
                .build();
        pars.add(tokenPar.build());

        tokenPar = new ParameterBuilder();
        tokenPar.name("osm").description("客户端设备型号MODEL").modelRef(new ModelRef("string")).parameterType("header").required(false)
                .build();
        pars.add(tokenPar.build());

        tokenPar = new ParameterBuilder();
        tokenPar.name("token").description("token").modelRef(new ModelRef("string")).parameterType("header").required(false)
                .build();
        pars.add(tokenPar.build());

        tokenPar = new ParameterBuilder();
        tokenPar.name("deviceToken").description("deviceToken").modelRef(new ModelRef("string")).parameterType("header").required(false)
                .build();
        pars.add(tokenPar.build());

        //添加head参数end

        return new Docket(DocumentationType.SWAGGER_2).select().apis(RequestHandlerSelectors
                .basePackage("com.citysmart.ucenter.api"))
                .paths(PathSelectors.any()).build()
                .globalOperationParameters(pars).apiInfo(apiInfo());

    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("标题：手上青秀app_接口文档").description("描述：").contact("liuguicheng、lubin、lizhi")
                                   .version("版本号:1.0").build();
    }

}