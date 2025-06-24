package utils;

import java.io.InputStream;
import java.util.Properties;

public class EnvLoader {
    private static Properties props = new Properties();

    static {
        try {
            // Load file .env từ classpath (tức: /WEB-INF/classes)
            ClassLoader classLoader = EnvLoader.class.getClassLoader();
            InputStream input = classLoader.getResourceAsStream(".env");

            if (input == null) {
                System.err.println("❌ Không tìm thấy file .env trong classpath!");
            } else {
                props.load(input);
                System.out.println("✅ Load .env từ classpath thành công!");
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi khi load file .env:");
            e.printStackTrace();
        }
    }

    public static String get(String key) {
        return props.getProperty(key);
    }
}
