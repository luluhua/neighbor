package com.citysmart.common.util;


import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.security.SecureRandom;
import java.util.regex.Pattern;
/***
 * @Author liuguicheng
 * @Description //TODO security  BCrypt 加密 验证加密工具
 * @Date 16:52 2019/7/5
 * @Param 
 * @return 
 **/
public class MyPasswordEncoder implements PasswordEncoder {


    private Pattern BCRYPT_PATTERN;
    private final Log logger;
    private final int strength;
    private final SecureRandom random;

    public MyPasswordEncoder() {
        this(-1);
    }

    public MyPasswordEncoder(int strength) {
        this(strength, (SecureRandom)null);
    }

    public MyPasswordEncoder(int strength, SecureRandom random) {
        this.BCRYPT_PATTERN = Pattern.compile("\\A\\$2a?\\$\\d\\d\\$[./0-9A-Za-z]{53}");
        this.logger = LogFactory.getLog(this.getClass());
        if (strength == -1 || strength >= 4 && strength <= 31) {
            this.strength = strength;
            this.random = random;
        } else {
            throw new IllegalArgumentException("Bad strength");
        }
    }
    @Override
    public String encode(CharSequence rawPassword) {
        String salt;
        if (this.strength > 0) {
            if (this.random != null) {
                salt = BCrypt.gensalt(this.strength, this.random);
            } else {
                salt = BCrypt.gensalt(this.strength);
            }
        } else {
            salt = BCrypt.gensalt();
        }

        return BCrypt.hashpw(rawPassword.toString(), salt);
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        if (encodedPassword != null && encodedPassword.length() != 0) {
            if (!this.BCRYPT_PATTERN.matcher(encodedPassword).matches()) {
                this.logger.warn("Encoded password does not look like BCrypt");
                return false;
            } else {
                return BCrypt.checkpw(rawPassword.toString(), encodedPassword);
            }
        } else {
            this.logger.warn("Empty encoded password");
            return false;
        }
    }
}

