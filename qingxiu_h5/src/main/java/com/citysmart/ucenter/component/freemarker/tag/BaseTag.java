package com.citysmart.ucenter.component.freemarker.tag;

import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

public class BaseTag implements TemplateDirectiveModel {
    private String clazzPath = null;

    public BaseTag(String targetClassPath) {
        clazzPath = targetClassPath;
    }

    private String getMethod(Map params) {
        return this.getParam(params, "method");
    }


    private void verifyParameters(Map params) throws TemplateModelException {
        String permission = this.getMethod(params);
        if (permission == null || permission.length() == 0) {
            throw new TemplateModelException("The 'name' tag attribute must be set.");
        }
    }

    String getParam(Map params, String paramName) {
        Object value = params.get(paramName);
        return value instanceof SimpleScalar ? ((SimpleScalar) value).getAsString() : null;
    }

    private DefaultObjectWrapper getBuilder() {
        return new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_23).build();
    }

    private TemplateModel getModel(Object o) throws TemplateModelException {
        return this.getBuilder().wrap(o);
    }


    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        this.verifyParameters(map);
        String funName = getMethod(map);
        Method method = null;
        try {
            Class clazz = Class.forName(clazzPath);
            method = clazz.getDeclaredMethod(funName, Map.class);
            if (method != null) {
                Object res = method.invoke(this, map);
                environment.setVariable(funName, getModel(res));
            }
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        templateDirectiveBody.render(environment.getOut());
    }
}
