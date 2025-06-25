package utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Environment variable loader utility
 * Loads configuration from environment variables and .env files
 */
public class EnvLoader {
    private static Properties properties = new Properties();
    
    static {
        loadEnvironmentVariables();
    }
    
    /**
     * Load environment variables from system and .env file
     */
    private static void loadEnvironmentVariables() {
        // Load from .env file if exists
        try {
            // Try to load from file system first
            try (FileInputStream fis = new FileInputStream(".env")) {
                properties.load(fis);
                System.out.println("✅ Loaded .env file from file system");
            } catch (IOException e) {
                // Try to load from classpath
                ClassLoader classLoader = EnvLoader.class.getClassLoader();
                try (InputStream input = classLoader.getResourceAsStream(".env")) {
                    if (input != null) {
                        properties.load(input);
                        System.out.println("✅ Loaded .env file from classpath");
                    } else {
                        System.out.println("⚠️ No .env file found in classpath");
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("⚠️ Could not load .env file: " + e.getMessage());
        }
        
        // Override with system environment variables (these take precedence)
        for (String key : System.getenv().keySet()) {
            properties.setProperty(key, System.getenv(key));
        }
        
        System.out.println("✅ Environment variables loaded successfully");
    }
    
    /**
     * Get environment variable value
     * @param key the environment variable key
     * @return the value or null if not found
     */
    public static String get(String key) {
        return properties.getProperty(key);
    }
    
}
