package com.citysmart.common.util;

import org.apache.commons.lang3.StringUtils;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

public class PBKDF2Util {
    public static final String PBKDF2_ALGORITHM = "PBKDF2WithHmacSHA1";

    /**
     * The following constants may be changed without breaking existing hashes.
     */
    public static final int SALT_BYTE_SIZE = 24;
    public static final int HASH_BYTE_SIZE = 24;
    public static final int PBKDF2_ITERATIONS = 1024;

    public static final int ITERATION_INDEX = 0;
    public static final int SALT_INDEX = 1;
    public static final int PBKDF2_INDEX = 2;

    /**
     * Returns a salted PBKDF2 hash of the password.:hash
     *
     * @param password the password to hash
     * @return a salted PBKDF2 hash of the password
     */
    public static String createHash(String password, String salt)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        return getHash(createHash(password.toCharArray(), salt));
    }

    /**
     * Returns a salted PBKDF2 hash of the password.--{iteration}:{salt}:{hash}
     *
     * @param password the password to hash
     * @return a salted PBKDF2 hash of the password
     */
    public static String createHash(char[] password, String _salt)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        // Generate a random salt
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[SALT_BYTE_SIZE];
        if (StringUtils.isNotBlank(_salt)) {
            salt = fromHex(_salt);
        } else {
            random.nextBytes(salt);
            _salt = toHex(salt);
        }

        // Hash the password
        byte[] hash = pbkdf2(password, salt, PBKDF2_ITERATIONS, HASH_BYTE_SIZE);
        // format iterations:salt:hash
        return PBKDF2_ITERATIONS + ":" + _salt + ":" + toHex(hash);
    }

    /**
     * Validates a password using a hash.
     *
     * @param password    the password to check
     * @param correctHash the hash of the valid password
     * @return true if the password is correct, false if not
     */
    public static boolean validatePassword(String password, String correctHash, String salt)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        return validatePassword(password.toCharArray(), correctHash, salt);
    }

    /**
     * Validates a password using a hash.
     *
     * @param password    the password to check
     * @param correctHash the hash of the valid password
     * @return true if the password is correct, false if not
     */
    public static boolean validatePassword(char[] password, String correctHash, String salt)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        // Decode the hash into its parameters
        byte[] hash = fromHex(correctHash);
        // Compute the hash of the provided password, using the same salt,
        byte[] _salt = fromHex(salt);
        // iteration count, and hash length
        byte[] testHash = pbkdf2(password, _salt, PBKDF2_ITERATIONS, hash.length);
        // Compare the hashes in constant time. The password is correct if
        // both hashes match.
        return slowEquals(hash, testHash);
    }

    /**
     * Compares two byte arrays in length-constant time. This comparison method
     * is used so that password hashes cannot be extracted from an on-line
     * system using a timing attack and then attacked off-line.
     *
     * @param a the first byte array
     * @param b the second byte array
     * @return true if both byte arrays are the same, false if not
     */
    private static boolean slowEquals(byte[] a, byte[] b) {
        int diff = a.length ^ b.length;
        for (int i = 0; i < a.length && i < b.length; i++) {
            diff |= a[i] ^ b[i];
        }
        return diff == 0;
    }

    /**
     * Computes the PBKDF2 hash of a password.
     *
     * @param password   the password to hash.
     * @param salt       the salt
     * @param iterations the iteration count (slowness factor)
     * @param bytes      the length of the hash to compute in bytes
     * @return the PBDKF2 hash of the password
     */
    private static byte[] pbkdf2(char[] password, byte[] salt, int iterations, int bytes)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        PBEKeySpec spec = new PBEKeySpec(password, salt, iterations, bytes * 8);
        SecretKeyFactory skf = SecretKeyFactory.getInstance(PBKDF2_ALGORITHM);
        return skf.generateSecret(spec).getEncoded();
    }

    /**
     * Converts a string of hexadecimal characters into a byte array.
     *
     * @param hex the hex string
     * @return the hex string decoded into a byte array
     */
    private static byte[] fromHex(String hex) {
        byte[] binary = new byte[hex.length() / 2];
        for (int i = 0; i < binary.length; i++) {
            binary[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        return binary;
    }

    /**
     * Converts a byte array into a hexadecimal string.
     *
     * @param array the byte array to convert
     * @return a length*2 character string encoding the byte array
     */
    private static String toHex(byte[] array) {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0) {
            return String.format("%0" + paddingLength + "d", 0) + hex;
        } else {
            return hex;
        }
    }

    /**
     * @param correctHash
     * @return
     */
    public static String getSalt(String correctHash) {
        String[] params = correctHash.split(":");
        return params[SALT_INDEX];
    }

    /**
     * @param correctHash
     * @return
     */
    public static String getHash(String correctHash) {
        String[] params = correctHash.split(":");
        return params[PBKDF2_INDEX];
    }
    public static void main(String[] args) {
        try {
            String _salt = "f9b52eb2b1ebffe03b1964a200cef63c2bee1ab2096de9f1";
            String hash = createHash("123456".toCharArray(),_salt);
            System.out.println(PBKDF2Util.getSalt(hash));
            System.out.println(PBKDF2Util.getHash(hash));
            byte[] hashByte = pbkdf2("123456".toCharArray(),fromHex(_salt),PBKDF2_ITERATIONS, HASH_BYTE_SIZE);
            System.out.println(toHex(hashByte));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
