package com.paulomlr.services;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.logging.Logger;

public class WebScraperService {
    private static final Logger LOGGER = Logger.getLogger(WebScraperService.class.getName());

    public Document fetchDocument(String targetUrl) throws IOException {
        LOGGER.info(() -> "Accessing URL: " + targetUrl);
        return Jsoup.connect(targetUrl).timeout(10_000).get();
    }

    public String extractLink(Document doc, String selector, String attachmentName) {
        String link = doc.select(selector).attr("href");
        if (link.isEmpty()) {
            throw new RuntimeException("Could not find link for " + attachmentName + ". Check selector: " + selector);
        }
        LOGGER.info(() -> "Link found for " + attachmentName + ": " + link);
        return link;
    }
}