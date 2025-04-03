package com.paulomlr.services;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileCompressionService {
    private static final Logger LOGGER = Logger.getLogger(FileCompressionService.class.getName());

    public void zipFiles(String zipName, String... files) throws IOException {
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipName))) {
            for (String file : files) {
                File fileToZip = new File(file);
                if (!fileToZip.exists()) {
                    LOGGER.log(Level.SEVERE, () -> "File not found: " + file);
                    continue;
                }
                zos.putNextEntry(new ZipEntry(file));
                Files.copy(Path.of(file), zos);
                zos.closeEntry();
                LOGGER.info(() -> "File added to ZIP: " + file);
            }
        }
    }
}