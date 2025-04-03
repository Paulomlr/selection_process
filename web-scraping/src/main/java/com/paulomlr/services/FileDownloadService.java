package com.paulomlr.services;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.logging.Logger;

public class FileDownloadService {
    private static final Logger LOGGER = Logger.getLogger(FileDownloadService.class.getName());
    private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();

    public void downloadFile(String fileUrl, String outputPath) throws IOException {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(fileUrl))
                .build();

        try (InputStream in = HTTP_CLIENT.send(request, HttpResponse.BodyHandlers.ofInputStream()).body();
             FileOutputStream out = new FileOutputStream(outputPath)) {

            in.transferTo(out);
            LOGGER.info(() -> "Downloaded file: " + outputPath);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new IOException("Download interrupted", e);
        }
    }

    public String ensureAbsoluteUrl(String baseUrl, String url) {
        return url.startsWith("http") ? url : baseUrl + url;
    }
}