package com.edumanage.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {

    // Base upload directory (project root ke andar "uploads" folder)
    private static final String UPLOAD_DIR = System.getProperty("user.dir") + "/uploads";

    public static String saveFile(String fileName, MultipartFile multipartFile) throws IOException {
        // Ensure upload directory exists
        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Unique filename generate karo
        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

        // Target path
        Path filePath = uploadPath.resolve(uniqueFileName);

        // Save file
        multipartFile.transferTo(filePath.toFile());

        return uniqueFileName; // return stored filename
    }

    public static String getUploadDir() {
        return UPLOAD_DIR;
    }
}
