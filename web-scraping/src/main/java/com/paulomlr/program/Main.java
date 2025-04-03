package com.paulomlr.program;

import com.paulomlr.services.FileCompressionService;
import com.paulomlr.services.FileDownloadService;
import com.paulomlr.services.WebScraperService;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {
    private static final Logger LOGGER = Logger.getLogger(Main.class.getName());

    private static final String BASE_URL = "https://www.gov.br";
    private static final String TARGET_URL = BASE_URL + "/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos";
    private static final String ATTACHMENT1_SELECTOR = "a[href*=Anexo_I]";
    private static final String ATTACHMENT2_SELECTOR = "a[href*=Anexo_II]";
    private static final String ATTACHMENT1_FILENAME = "attachment1.pdf";
    private static final String ATTACHMENT2_FILENAME = "attachment2.pdf";
    private static final String ZIP_FILENAME = "attachments.zip";

    public static void main(String[] args) {
        WebScraperService scraperService = new WebScraperService();
        FileDownloadService downloadService = new FileDownloadService();
        FileCompressionService compressionService = new FileCompressionService();

        try {
            LOGGER.info("Starting Test 1: Web Scraping and PDF Compression");

            Document document = scraperService.fetchDocument(TARGET_URL);

            String linkAttachment1 = scraperService.extractLink(document, ATTACHMENT1_SELECTOR, "Anexo I");
            String linkAttachment2 = scraperService.extractLink(document, ATTACHMENT2_SELECTOR, "Anexo II");

            String fileUrl1 = downloadService.ensureAbsoluteUrl(BASE_URL, linkAttachment1);
            String fileUrl2 = downloadService.ensureAbsoluteUrl(BASE_URL, linkAttachment2);

            downloadService.downloadFile(fileUrl1, ATTACHMENT1_FILENAME);
            downloadService.downloadFile(fileUrl2, ATTACHMENT2_FILENAME);

            compressionService.zipFiles(ZIP_FILENAME, ATTACHMENT1_FILENAME, ATTACHMENT2_FILENAME);

            LOGGER.info("Test 1 completed successfully: " + ZIP_FILENAME + " generated.");
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, () -> "Error while running Test 1: " + e.getMessage());
        } catch (RuntimeException e) {
            LOGGER.log(Level.SEVERE, () -> "Error: " + e.getMessage());
        }
    }
}